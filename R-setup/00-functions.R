
###
### Convert pdf to png for html output -----------------------------------------
pdf2png <- function(path) {
  # only do the conversion for non-LaTeX output
  if (knitr::is_latex_output()) 
    return(path)
  path2 <- xfun::with_ext(path, "png")
  img <- magick::image_read_pdf(path)
  magick::image_write(img, path2, format = "png")
  path2
}

###
### Adapt kable to TeX (pdf), html (gitbook) or docx ---------------------------
display_table <- function(.list_opts=kab_opt, .format=book_format, .latex_scaling = FALSE, .scroll = FALSE){
  
  if (book_format == "latex") {
    
    tt <- do.call(kable, c(.list_opts, format = .format, linesep = "")) %>%
      kableExtra::kable_styling(position = 'center') ## removed for this book: "HOLD_position",
    
    if (.latex_scaling == "scale_down") {
      
      tt <- tt %>% kableExtra::kable_styling(latex_options = c("scale_down"))
      
    } else if (.latex_scaling == "lscp") {
      
      tt <- tt %>% 
        kableExtra::kable_styling(latex_options = c("scale_down")) %>%
        kableExtra::landscape()
    } ## END IF .latex_scaling
    
  } else if (book_format == "html") {
    
    tt <- do.call(kable, c(.list_opts, format = .format)) %>%
      kableExtra::kable_styling(full_width = F)
    
    if (.scroll) tt <- tt %>% scroll_box(height = "500px", extra_css = "margin-bottom: 1.2em;")
    
  } else {
    
    tt <- do.call(kable, .list_opts)
    
  } ## End if book_format
  
  return(tt)
  
} ## End function

###
### Custom include_graphics for the book

display_fig <- function(.name, .path=fig_path){
  
  knitr::include_graphics(paste0(fig_path, "/", .name, ".png"), auto_pdf = TRUE)
  
}
