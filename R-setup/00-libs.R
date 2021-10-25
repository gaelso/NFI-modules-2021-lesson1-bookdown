
## List required libraries
libs <- c(
  "rmarkdown", "bookdown", "tinytex", "tidyverse", "magick", "DiagrammeR",
  "grImport", "gridExtra", "DiagrammeRsvg", "rsvg", "extrafont", "htmltools", 
  "grImport2", "devtools"
)

## Install other missing libraries
libs_install <- libs[!(libs %in% installed.packages())]
libs_install

lapply(libs_install, install.packages)

rm(libs_install)

## Load libraries
lapply(libs, require, character.only = TRUE)

## Install the dev version of tikzDevice
if (!("tikzDevice" %in% installed.packages())) {
  devtools::install_github("yihui/tikzDevice", force = TRUE) 
} else {
  require(tikzDevice)
}

## Add amssymb to tikzDevice for Diameter symbol (\varnothing)
# options(
#   tikzMetricPackages = c("\\usepackage[T1]{fontenc}\n","\\usetikzlibrary{calc}\n")
#   )

options(
  tikzLatexPackages = c(getOption("tikzLatexPackages"),"\\usepackage{amsmath,amssymb}")
  )



## Load Windows fonts and add Computer modern if missing -- for Windows
if (Sys.info()['sysname'] == "Windows") {
  
  windowsFonts()
  
  if (!("CMU Serif"  %in% names(windowsFonts()))) {
    download.file(
      url = "https://www.fontsquirrel.com/fonts/download/computer-modern", 
      destfile = paste0(fig_path, "/computer-modern.zip"), 
      mode = "wb"
    )
    unzip(zipfile = paste0(fig_path, "/computer-modern.zip"), exdir = paste0(fig_path, "/computer-modern"))
    extrafont::font_import(paths = fig_path, recursive = T, pattern = "cmu*", prompt = FALSE)
    extrafont::loadfonts(device = "win")
  } ## END IF check font CMU
  
} ## END IF check OS



