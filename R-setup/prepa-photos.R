
###
### Load photos ----------------------------------------------------------------

## Resize all pictures to the desired density -- RUN ONE TIME ONLY
# photo_file <- list.files(path = img_path, full.names = T)
# photo_names <- photo_file %>% 
#   str_remove(pattern = '.*/') %>%
#   str_remove(pattern = ".jpg|.png")
# 
# for (i in seq_along(photo_file)) {
#   
#   photo <- magick::image_read(path = photo_file[[i]])
#   
#   if (magick::image_info(photo)$density != img_size$density) {
#     
#     magick::image_write(photo, path = paste0(img_path, "/", photo_names[[i]], "_not72.jpg"))
#     magick::image_write(photo, path = paste0(photo_file[[i]]), density = "72x72")
#     
#   }
#   
# }
# 
# rm(photo)

## Load again the correct sized pictures
photo_file <- setdiff(
  list.files(path = img_path, full.names = T),
  list.files(path = img_path, full.names = T, pattern = "not72")
)

photo_list <- map(photo_file, magick::image_read)

photo_names <- photo_file %>% 
  str_remove(pattern = '.*/') %>%
  str_remove(pattern = ".jpg|.png")

names(photo_list) <- photo_names

rm(photo_file, photo_names)

###
### Photos Chapter 1 -----------------------------------------------------------

## euca

euca <- c(photo_list$eucalyptus1 , photo_list$eucalyptus2) %>%
  image_scale(paste0(img_size$width, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "0x5") %>%
  magick::image_append(stack = TRUE)
euca

## mix
mix <- c(photo_list$mixcan, photo_list$mixcosta) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x0") %>%
  image_append()
mix


###
### Photos Chapter 3 -----------------------------------------------------------

## arriv
arriv <- c(photo_list$arrivee2, photo_list$arrivee1) %>%
  image_scale(paste0(img_size$width/2, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "5x5") %>%
  magick::image_append()
arriv


## congo
congo <- c(photo_list$congo1, photo_list$congo2) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
congo


## gha
gha <- c(photo_list$profil1, photo_list$profil2) %>%
  image_scale(paste0(img_size$width/2, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "5x5") %>%
  magick::image_append()
gha


## thai
thai <- c(photo_list$thailand1, photo_list$thailand2) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
thai

## chen
chen <- c(photo_list$rond1, photo_list$rond2, photo_list$rond3) %>%
  image_scale(paste0(img_size$width/3, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "5x5") %>%
  magick::image_append()
chen

## mlab
mlab1 <- c(photo_list$ecorce1, photo_list$ecorce2, photo_list$ecorce3) %>%
  image_scale(paste0(img_size$width/3, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "4x5") %>%
  magick::image_append()

mlab2 <- c(photo_list$ghana3, photo_list$ghana4) %>%
  image_scale(paste0(img_size$width/2, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "7x5") %>%
  magick::image_append()

mlab <- c(mlab1, mlab2) %>%
  magick::image_append(stack = TRUE)
mlab

## ka
ka <- c(photo_list$cameroun1, photo_list$cameroun2) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
ka  

## ghan
ghana2 <- photo_list$ghana2 %>%
  image_rotate(90)

ghan <- c(photo_list$ghana1, ghana2) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
ghan  

## evor
evor <- c(photo_list$root1, photo_list$root2) %>%
  image_scale(paste0(img_size$width/2, "x")) %>%
  image_border("black", "2x2") %>% 
  image_border("white", "7x5") %>%
  magick::image_append()
evor

## air
air <- c(photo_list$air1, photo_list$air2, photo_list$air3) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
air

## mats
mats <- c(photo_list$matos1, photo_list$matos2, photo_list$matos3) %>%
  image_scale(paste0(img_size$width/3, "x")) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
mats  

## cad 
cad <- c(photo_list$fagot1, photo_list$fagot2, photo_list$fagot3) %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5") %>%
  image_append()
cad

## tsp
tsp <- photo_list$transport %>%
  image_scale(paste0("x", img_size$height)) %>%
  image_border("black", "2x2") %>%
  image_border("white", "5x5")
tsp  
