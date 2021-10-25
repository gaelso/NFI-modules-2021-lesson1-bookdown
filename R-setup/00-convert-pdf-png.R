
list_fig <- list.files(path = fig_path, pattern = "pdf", full.names = TRUE)

conv_png <- function(.path){
  
  print(.path)
  path2 <- xfun::with_ext(.path, "png")
  fig <- magick::image_read_pdf(.path)
  magick::image_write(fig, path2 , format = "png", density = img_size$density)
}

walk(list_fig, conv_png)
