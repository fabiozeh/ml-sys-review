#!/bin/env bash
#
# This file reproduces all steps of data processing necessary to use the source bibliographic files.

cat ../../data/wos* > ./wos.bib
./merge_wos_scopus.R  wos.bib ../../data/scopus.bib
rm ./wos.bib

