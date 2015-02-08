plot2 <- function () {
  
  library(sqldf)
  
  input_data <- read.csv.sql("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  png(file = "plot2.png")
  
  dateTime <- as.POSIXlt(paste(as.Date(input_data$Date, format="%d/%m/%Y"),input_data$Time, sep = " "))
  
  with(input_data, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)"))
  
  dev.off()  
  
}