$pdflatex = 'lualatex -synctex=1 -halt-on-error -file-line-error %O %S';
$bibtex = 'bibtex';
$makeindex = 'mendex %O -o %D %S';
$pdf_mode = 1;
$clean_ext = "acn acr alg aux bbl bcf blg idx ilg ind ist lof log lot out run.xml synctex.gz toc";
$clean_ext .= " fdb_latexmk fls snm nav bbl-SAVE-ERROR";
$clean_full_ext = "pdf dvi ps";

END {
  if ($cleanup_mode) { return; }

  if ($#default_files >= 0) {
    system("latexmk -c @default_files");
  }
}