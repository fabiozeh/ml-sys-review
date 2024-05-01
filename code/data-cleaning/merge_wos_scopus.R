#!/usr/bin/env Rscript
# This script uses the Bibliometrix library to merge source BibTeX files obtained from Scopus and from Web of Science.
# Usage: merge_wos_scopus <wos file path> <scopus file path>
# The resulting file will be saved as merged.csv in the current directory.

options(repos = list(CRAN="http://cran.rstudio.com/"))
args = commandArgs(trailingOnly=TRUE)

# test if the file names have been informed
if (length(args) < 2) {
  stop("Not enough arguments. Usage: merge_wos_scopus <scopus file path> <wos file path>", call.=FALSE)
}

# install and load dependencies
if (!require("bibliometrix")) {
    if (!require("remotes")) {
        install.packages("remotes")
    }
    remotes::install_github("massimoaria/bibliometrix")
    install.packages("bibliometrix", dependencies = TRUE)
}
A<-convert2df(args[1], dbsource = 'isi', format = "bibtex")
B<-convert2df(args[2], dbsource = 'scopus', format = "bibtex")
M<-mergeDbSources(A,B, remove.duplicated = TRUE)

write.csv(M, "merged.csv")
