plot3 <- function () {
  
  library(sqldf)
  
  input_data <- read.csv.sql("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  png(file = "plot3.png")
  
  dateTime <- as.POSIXlt(paste(as.Date(input_data$Date, format="%d/%m/%Y"),input_data$Time, sep = " "))
    
  with(input_data, {
       plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
       lines(dateTime, Sub_metering_2, type = "l", col = "red")
       lines(dateTime, Sub_metering_3, type = "l", col = "blue")
  })
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(input_data[,7:9]))  

  dev.off()  
  
}