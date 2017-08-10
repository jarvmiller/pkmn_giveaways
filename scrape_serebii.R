library(tidyr)
library(rvest)

url <- "http://www.serebii.net/events/dex/"
dex_entry <- sprintf("%03d", seq(1, 802))
full_url <- paste(url, dex_entry, ".shtml", sep='')

# how to handle if one year has multiple releases ie 2006 has america and japand
get_poke_data <- function(url){
  html <- read_html(url)
  # first row is name, 
  # even rows are location, odd are year
  # if length() is one, it has not been released
  data <- html_nodes(html, '.dextab b , u') %>% html_text()
  n <- length(data)
  if (n==1){
    location <- NA
    year <- NA
  }
  else{
    location <- data[seq(3, n, by=2)]
    year <- data[seq(2, n, by=2)]
  }
  df <- data.frame(location, year)
  df$name <- data[1]
  
  return(df)
}