# Third-party notices

The materials listed below retain their respective copyright and license terms.

## Beamer

`src/beamerthemeenlp.sty` adapts frame collection and title detection from Beamer's `beamerbaseframe.sty` to preserve a leading brace group and apply the theme's body formatting.
The upstream frame collector is based on code from `amsmath`.
`src/beamerouterthemeenlp.sty` adapts the same file's `t` frame option to change the top and bottom skips.

The upstream source credits Till Tantau, Vedran Miletić, Joseph Wright, Louis Stuart, and samcarter.
The adapted portions are distributed under the LaTeX Project Public License (LPPL), version 1.3c or later. [Beamer source](https://github.com/josephwright/beamer/blob/main/base/beamerbaseframe.sty), [Beamer license](https://github.com/josephwright/beamer/blob/main/LICENSE.md), [LPPL 1.3c](https://www.latex-project.org/lppl/lppl-1-3c/)

## Bibliography styles

`src/enlpbeamer.bst` redistributes Patrick W Daly's `plainnat.bst` with a theme-specific filename and header.
The upstream copyright notice and LPPL terms, version 1 or later, are retained in the file. [Natbib source and distribution](https://ctan.org/pkg/natbib)

`src/enlpbeamer.cbx` adapts the `\supercite` implementation from BibLaTeX's `numeric-comp.cbx` for the theme's bracketed, superscripted `\cite` command.
BibLaTeX copyright belongs to Philipp Lehman and Philip Kime, as recorded upstream.
The adapted material remains under the LPPL, version 1.3 or later. [BibLaTeX source and license](https://github.com/plk/biblatex#copyright-and-licence), [LPPL text](https://www.latex-project.org/lppl/)

## Embedded fonts

`docs/documentation.pdf` embeds subsets of TeX Gyre Heros and Latin Modern Mono under the GUST Font License, and the AMS Computer Modern symbol font `cmsy10` under the SIL Open Font License 1.1. [TeX Gyre Heros](https://ctan.org/pkg/tex-gyre-heros), [Latin Modern](https://ctan.org/pkg/lm), [AMSFonts license](https://mirrors.ctan.org/fonts/amsfonts/OFL.txt)
