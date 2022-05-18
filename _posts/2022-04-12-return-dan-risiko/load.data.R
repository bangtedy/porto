load.data <- function(rawdata, ticker){
  data.raw <- read.csv(rawdata, header = TRUE)
  Date <- as.Date(data.raw$Date, format = "%Y−%m−%d")
  data.raw <- cbind(Date, data.raw[,-1])
  data.raw <- data.raw[order(data.raw$Date),]
  data.raw <- xts(data.raw[, 2:7],order.by = data.raw[, 1])
  A <- paste(ticker, ".Open", sep = "")
  B <- paste(ticker, ".High", sep = "")
  C <- paste(ticker, ".Low", sep = "")
  D <- paste(ticker, ".Close", sep = "")
  E <- paste(ticker, ".Adjusted", sep="")
  F <- paste(ticker, ".Volume", sep="")
  names(data.raw) <- paste(c(A, B, C, D, E, F))
  data.raw <- cbind(data.raw[, 1:4], data.raw[, 6], data.raw[, 5])
  return(data.raw)}
