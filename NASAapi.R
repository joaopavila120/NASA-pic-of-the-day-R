# https://apod.nasa.gov/apod/astropix.html

library(jsonlite)
library(jpeg)

url <- "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
NASA <- fromJSON(url)

download.file(NASA$url, "temp.jpg", mode = "wb")
localJPEG <- readJPEG("temp.jpg")

#Set up the plot area
plot(1:3, type='n', main="Astronomy Picture of the Day", 
     xlab="x", ylab="y")

#Get the plot information so the image will fill the plot box, and draw it
lim <- par()
rasterImage(localJPEG, lim$usr[1], lim$usr[3], lim$usr[2], lim$usr[4])
