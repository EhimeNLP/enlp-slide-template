#!/usr/bin/env texlua

local lfs = require("lfs")

local function dirname(path)
  local dir = path:match("^(.*)[/\\][^/\\]*$")
  if dir == nil or dir == "" then
    return "."
  end
  return dir
end

local function basename_without_lvt(path)
  return path:match("([^/\\]+)%.lvt$")
end

local function shell_quote(value)
  return "'" .. tostring(value):gsub("'", "'\\''") .. "'"
end

local function split_words(value)
  local words = {}
  for word in value:gmatch("%S+") do
    words[#words + 1] = word
  end
  return words
end

local function collect_tests(test_dir)
  local tests = {}
  for entry in lfs.dir(test_dir) do
    local test_name = basename_without_lvt(entry)
    if test_name then
      tests[#tests + 1] = test_name
    end
  end
  table.sort(tests)
  return tests
end

local script_dir = dirname(arg[0])
local cwd = lfs.currentdir()
if not script_dir:match("^/") then
  script_dir = cwd .. "/" .. script_dir
end
local repo_root = dirname(script_dir)

local engines = split_words(os.getenv("ENGINES") or "luatex ptex uptex xetex")
local tests = {}

if #arg > 0 then
  for index = 1, #arg do
    tests[#tests + 1] = arg[index]
  end
else
  tests = collect_tests(script_dir)
end

assert(lfs.chdir(repo_root))

for _, test_name in ipairs(tests) do
  for _, engine in ipairs(engines) do
    print(string.format("==> regenerating %s (%s)", test_name, engine))
    local command = table.concat({
      "l3build",
      "save",
      "--engine",
      shell_quote(engine),
      shell_quote(test_name),
    }, " ")
    local ok, _, code = os.execute(command)
    if not ok then
      os.exit(code or 1)
    end
  end
end
