library(tidyr)
library(rvest)

url <- "http://www.serebii.net/events/dex/"
dex_entry <- sprintf("%03d", seq(1, 802))
full_url <- paste(url, dex_entry, ".shtml", sep='')