

###
### Figures chapter 2 ----------------------------------------------------------

###
### cha
###

cha <- grViz("digraph cha {
  
  splines = false
  graph [layout = dot, rankdir = LR]
  
  ## Add node statements
  node [shape = plaintext, fontname = 'CMU Serif']
  A[label = 'Stand \nstudied']
  B[label = 'Trees \nmeasured']
  C[label = Model]
  D1[label = 'Volume of an \nindividual tree']
  D2[label = 'Mean tree \nvolume']
  D3[label = 'Volume of the \nstudied stand']
  D4[label = 'Volume of \nanother stand']
  
  ## Add edge statements
  edge [fontname = 'CMU Serif']
  A -> B [label = 'sampling']
  A -> B [label = 'plan']
  B -> C [label = 'model']
  B -> C [label = 'construction']
  C:e -> D1:w [label = 'prediction']
  C:e -> D2:w
  C:e -> D3:w
  C:e -> D4:w [label = '']
  C:e -> D4:w [label = 'extrapolation  ']
  
  }",
)

cha_svg <- cha %>%
  export_svg() 

cha_svg %>%
  charToRaw %>% 
  rsvg_pdf(paste0(fig_path, "/cha.pdf"))

html_print(HTML(cha_svg))


###
### plan
###

arbre   <- magick::image_read(paste0(fig_path, "/arbre.png")) 
arbrex8 <- magick::image_read(paste0(fig_path, "/arbrex8.png"))

arbre_compo <- image_blank(width = 1200, height = 500, color = 'white') %>%
  image_composite(
    composite_image = image_scale(arbrex8, paste0("x", img_size$height/6)), 
    gravity = "southwest", 
    offset = "+100+100") %>%
  image_composite(
    composite_image = image_scale(arbre, paste0("x", img_size$height/4)),
    gravity = "southwest", 
    offset = "+400+100"
  ) %>%
  image_composite(
    composite_image = image_scale(arbrex8, paste0("x", img_size$height/2)),
    gravity = "southwest", 
    offset = "+650+100"
  )
arbre_compo

plan <- arbre_compo %>%
  image_draw()
## Bottom arrow
rect(xleft = 100, xright = 1040, ybottom = 419, ytop = 420)
text(1035, 421, ">", cex = 3)
## Bottom left bracket
rect(xleft = 170, xright = 430, ybottom = 469, ytop = 470)
rect(xleft = 170, xright = 171, ybottom = 470, ytop = 460)
rect(xleft = 429, xright = 430, ybottom = 470, ytop = 460)
## Bottom right bracket
rect(xleft = 470, xright = 730, ybottom = 469, ytop = 470)
rect(xleft = 470, xright = 471, ybottom = 470, ytop = 460)
rect(xleft = 729, xright = 730, ybottom = 470, ytop = 460)

dev.off()

###
### Figures chapter 3 ----------------------------------------------------------

###
### compart
###

## Read SVG file
comparts_vec <- grImport2::readPicture(paste0(fig_path, "/svg/comparts.pdf.svg"))
grImport2::grid.picture(comparts_vec)


###
### emond
###

emonde1 <- grImport2::readPicture(paste0(fig_path, "/svg/emonde1.pdf.svg"))
emonde2 <- photo_list$emonde2 
white_space <- rectGrob(gp = gpar(col = NA, fill = "white"))

# grid.arrange(
#   white_space,
#   pictureGrob(emonde1), 
#   rasterGrob(emonde2, x = 0.5, y = 0.5, w = 0.7), 
#   ncol = 3 
# )


###
### vanu
###

vanu <- grImport2::readPicture(paste0(fig_path, "/svg/vanuatu.pdf.svg"))

# plot.new()
# grid.picture(vanu)
# grid.raster(photo_list$cocoteraie, x = 0.27, y = 0.3, w = 0.25)
