# Description: This file is used to test the capabilities of webR and Google Apps Script.

# Author: Louis

library(ggplot2)
library(svglite)
library(base64enc)

data_plot <- data.frame(x = c(1,2,3,4),
                        y = c(8,9,10,11))

png("tmp/plot.png", width = 400, height = 300)

plot <- data_plot |> 
  ggplot(aes(x = x,
             y = y)) +
  geom_point()

# Save plot to a temporary PNG file
print(plot)
dev.off()

# Read file as raw vector
# img <- readBin("C:/Users/Louis/OneDrive - Grand Valley State University/GVSU/Work/R Files/Data_Literacy/helper-functions/plot.png", "raw", file.info("/tmp/plot.png")$size)

# Encode to base64 string
base64_str <- base64encode("tmp/plot.png")

# Return the encoded string
base64_str

png_file <- tempfile(fileext = ".png")
png(png_file, width=400, height=300)

plot <- plot(1:10)
ggsave("plot.png", plot)
base64enc::base64encode("plot.png")

dev.off()

plot <- plot(1:10)
png_file <- tempfile(fileext = ".png")
ggplot2::ggsave(png_file, plot)
base64enc::base64encode(plot)

# Trying an approach that doesn't write to the disc

data_plot <- data.frame(x = c(1, 2, 3, 4),
                        y = c(8, 9, 10, 11))

plot <- ggplot(data_plot, aes(x = x, y = y)) +
  geom_point()

# Create a temporary file
tmpfile <- tempfile(fileext = ".png")

# Write the plot to the temp file using CairoPNG
Cairo::CairoPNG(filename = tmpfile, width = 800, height = 600)
print(plot)
dev.off()

# Read the file back as raw
raw_vec <- readBin(tmpfile, what = "raw", n = file.info(tmpfile)$size)

# Convert to base64
base64_str <- base64enc::base64encode(raw_vec)
data_uri <- paste0("data:image/png;base64,", base64_str)

# Delete the temp file
unlink(tmpfile)

# Preview base64 string
substr(data_uri, 1, 100)



library(Cairo)
library(png)
library(ggplot2)
library(base64enc)

Cairo(file='/dev/null')

data_plot <- data.frame(x = c(1, 2, 3, 4),
                        y = c(8, 9, 10, 11))

p <- ggplot(data_plot, aes(x = x, y = y)) +
  geom_point()

# hidden stuff in Cairo
i = Cairo:::.image(dev.cur())
r = Cairo:::.ptr.to.raw(i$ref, 0, i$width * i$height * 4)
dim(r) = c(4, i$width, i$height) # RGBA planes
# have to swap the red & blue components for some reason
r[c(1,3),,] = r[c(3,1),,]
# now use the png library
p = writePNG(r, raw()) # raw PNG bytes

base64_str <- base64enc::base64encode(p)
data_uri <- paste0("data:image/png;base64,", base64_str)
data_uri


library(ggplot2)
library(svglite)

# Use a stable filename
svg_file <- "plot.svg"

# Save plot to SVG
svglite(svg_file, width = 5, height = 4)
ggplot(data.frame(x = 1:4, y = 8:11), aes(x, y)) +
  geom_point()
dev.off()

# Read SVG contents
svg_text <- paste(readLines(svg_file), collapse = "\n")

# Optional: embed as data URI
svg_base64 <- base64enc::base64encode(charToRaw(svg_text))
data_uri <- paste0("data:image/svg+xml;base64,", svg_base64)

data_uri  # Or embed directly in HTML


# Base R plotting to SVG
svg_file <- "plot.svg"
svg(svg_file, width = 5, height = 4)

plot(1:4, c(8, 9, 10, 11), pch = 19)

dev.off()

# Read and return SVG contents
paste(readLines(svg_file), collapse = "\\n")


tmp <- tempfile(fileext = ".svg")
svg(tmp, width=5, height=4)
plot(cars)
dev.off()
paste(readLines(tmp), collapse = "\\n")
