
## This script is to convert pdf vector images to svg, a better vector format for R

## Install Linux dependencies
## -- apt-get install libcairo2-dev libspectre-dev librsvg2-dev libpoppler-glib-dev

## Install grConvert
if (!("grConvert" %in% installed.packages())) {
  devtools::install_github("sjp/grConvert", force = TRUE)
}

library(grConvert)
grConvert.capabilities()

## Convert images
dir.create("source/figures/svg", showWarnings = FALSE)

convertPicture(paste0(fig_path, "/comparts.pdf"), paste0(fig_path, "/svg/comparts.pdf.svg"))
convertPicture(paste0(fig_path, "/emonde1.pdf"), paste0(fig_path, "/svg/emonde1.pdf.svg"))
convertPicture(paste0(fig_path, "/vanuatu.pdf"), paste0(fig_path, "/svg/vanuatu.pdf.svg"))


### ------------------------------------------------------------------------ ###
###            THIS IS A PLACEHOLDER FOR XML VERSION OF VECTOR FILES
###     OUTDATED - REPLACED WITH SVG (REQUIRES LINUX TO COVNERT PDF TO SVG)
### ------------------------------------------------------------------------ ###

## For Vector images:
## Install Ghostscript https://www.ghostscript.com/download/gsdnld.html and set path in Sys.setenv
# Sys.setenv(R_GSCMD = normalizePath("C:/Program Files/gs/gs9.53.3/bin/gswin64c.exe")) 

## Convert pdf to xml --- RUN ONE TIME
# grImport::PostScriptTrace(paste0(fig_path, "/comparts.pdf"), paste0(fig_path, "/xml/comparts.pdf.xml")) ## RUN ONE TIME
# grImport::PostScriptTrace(paste0(fig_path, "/emonde1.pdf"), paste0(fig_path, "/xml/emonde1.pdf.xml")) ## RUN ONE TIME
# grImport::PostScriptTrace(paste0(fig_path, "/vanuatu.pdf"), paste0(fig_path, "/xml/vanuatu.pdf.xml")) ## RUn one time

## NEED to replace svg with xml in the prepa-figure script

