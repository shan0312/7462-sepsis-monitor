## PUBH 7462 A7
## Yuting Shan

# load environment
library(tidyverse)
library(data.table) ## For the fread function
library(lubridate)
library(tictoc)

# load the functions
source("sepsis_monitor_functions.R")

#####Task #2 speed reading#####

# compare the time reading 50 pts
tic()
makeSepsisDataset(n=50, read_fn = "fread")
toc() # 6.923 second for fread

tic()
makeSepsisDataset(n=50, read_fn = "read_delim")
toc() # 21.283 second for read_delim

# compare the time reading 50 pts
tic()
makeSepsisDataset(n=100, read_fn = "fread")
toc() # 17.644 second for fread

tic()
makeSepsisDataset(n=100, read_fn = "read_delim")
toc() # 43.811 second for read_delim

# compare the time reading 50 pts
tic()
makeSepsisDataset(n=500, read_fn = "fread")
toc() # 45.166 second for fread

tic()
makeSepsisDataset(n=500, read_fn = "read_delim")
toc() # 1517.261 second for read_delim

#####Task #3 Upload to Google Drive#####
library(googledrive)
df <- makeSepsisDataset()

# We have to write the file to disk first, then upload it
df %>% write_csv("sepsis_data_temp.csv")

# Uploading happens here
sepsis_file <- drive_put(media = "sepsis_data_temp.csv", 
                         path = "https://drive.google.com/drive/folders/1QlcjU5Y0CA0IM_LojIiy5D8uO1pC7QXD",
                         name = "sepsis_data.csv")

# Set the file permissions so anyone can download this file.
sepsis_file %>% drive_share_anyone()



























