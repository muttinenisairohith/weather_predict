loaddata <- function(url){
  data <- read.csv(url)
  split <- sample.split(data, SplitRatio=0.8)
  split
  training <- subset(data,split=="TRUE")
  testing <- subset(data,split=="FALSE")
}
