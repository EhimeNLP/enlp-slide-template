module = "enlp-beamer"

sourcefiledir = "src"
docfiledir = "docs"
testfiledir = "tests"
supportdir = docfiledir

sourcefiles = { "*.sty", "*.bbx", "*.cbx", "*.bst" }
installfiles = { "*.sty", "*.bbx", "*.cbx" }

bstfiles = {
  "enlpbeamer.bst",
}

bibfiles = {
  "references.bib",
}

typesetfiles = {
  "documentation.tex",
}

docfiles = {
  ".latexmkrc",
}

checkfiles = bstfiles
checksuppfiles = bibfiles

typesetexe = "lualatex"

checkengines = { "luatex", "ptex", "uptex", "xetex" }
stdengine = "luatex"

tagfiles = {
  "README.md",
  "build.lua",
  "beamerthemeenlp.sty",
  "beamercolorthemeenlp.sty",
  "beamerfontthemeenlp.sty",
  "beamerinnerthemeenlp.sty",
  "beamerouterthemeenlp.sty",
  "enlplogo.sty",
  "enlpbeamer.bbx",
  "enlpbeamer.cbx",
  "enlpbeamer.bst",
  "documentation.tex",
  "references.bib",
}

specialtypesetting = specialtypesetting or {}
specialtypesetting["documentation.tex"] = {
  func = function(file, dir, _)
    return runcmd("latexmk " .. file, dir, {"TEXINPUTS", "LUAINPUTS"})
  end
}
