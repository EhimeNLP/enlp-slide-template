module = "enlp-beamer"

sourcefiledir = "src"
docfiledir = "docs"
testfiledir = "tests"
supportdir = sourcefiledir

sourcefiles = {
  "beamerthemeenlp.sty",
  "enlpbeamer.bbx",
  "enlpbeamer.cbx",
  "enlpbeamer.bst",
  "enlp-title-page.pdf",
  "enlp-heading-page.pdf",
  "enlp-content-page.pdf",
}

installfiles = {
  "beamerthemeenlp.sty",
  "enlpbeamer.bbx",
  "enlpbeamer.cbx",
  "enlp-title-page.pdf",
  "enlp-heading-page.pdf",
  "enlp-content-page.pdf",
}

bstfiles = {
  "enlpbeamer.bst",
}

bibfiles = {
  "references.bib",
}

typesetfiles = {
  "documentation.tex",
}

typesetsourcefiles = {
  "beamerthemeenlp.sty",
  "enlpbeamer.bbx",
  "enlpbeamer.cbx",
  "enlpbeamer.bst",
  "enlp-title-page.pdf",
  "enlp-heading-page.pdf",
  "enlp-content-page.pdf",
}

docfiles = {
  ".latexmkrc",
}

checksuppfiles = {
  "beamerthemeenlp.sty",
  "enlpbeamer.bbx",
  "enlpbeamer.cbx",
  "enlpbeamer.bst",
  "enlp-title-page.pdf",
  "enlp-heading-page.pdf",
  "enlp-content-page.pdf",
}

typesetexe = "lualatex"

checkengines = { "luatex", "ptex", "uptex", "xetex" }
stdengine = "luatex"

tagfiles = {
  "README.md",
  "build.lua",
  "beamerthemeenlp.sty",
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
