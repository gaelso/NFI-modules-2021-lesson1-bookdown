
## Interactive training modules on National Forest Inventory data analysis - handbook with solutions
## NFI-modules-2021-bookdown
## Gael Sola, FAO
## October 2021


## Raster and shapefile
# library(raster)
# library(stars)
# library(smoothr)
library(sf)
library(tmap)

tmap_options(check.and.fix = TRUE)

## Bookdown visualizations


## Tidy data
library(tidyverse)


## For downloadable pdf version
library(extrafont)

## Load Windows fonts and add Computer modern if missing -- for Windows
if (Sys.info()['sysname'] == "Windows") {
  
  dir.create("fonts", showWarnings = F)
  windowsFonts()
  
  if (!("CMU Serif"  %in% names(windowsFonts()))) {
    download.file(
      url = "https://www.fontsquirrel.com/fonts/download/computer-modern", 
      destfile = "fonts/computer-modern.zip", 
      mode = "wb"
    )
    unzip(zipfile = "fonts/computer-modern.zip", exdir = "fonts/computer-modern")
    extrafont::font_import(paths = "fonts", recursive = T, pattern = "cmu*", prompt = FALSE)
    extrafont::loadfonts(device = "win")
  } ## END IF check font CMU
  
} ## END IF check OS

