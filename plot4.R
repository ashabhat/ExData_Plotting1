plot4 <- function () {
  
  library(sqldf)
  
  input_data <- read.csv.sql("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
  
  png(file = "plot4.png", type = "cairo")
  par(mfrow = c(2,2))
  
  dateTime <- as.POSIXlt(paste(as.Date(input_data$Date, format="%d/%m/%Y"),input_data$Time, sep = " "))
  
  with(input_data, {
    plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(dateTime, Voltage, type = "l", xlab = "datetime")
    {plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
     lines(dateTime, Sub_metering_2, type = "l", col = "red")
     lines(dateTime, Sub_metering_3, type = "l", col = "blue")
     legend("topright", lty = 1, col = c("black", "red", "blue"), legend = names(input_data[,7:9]))
    }
    plot(dateTime, Global_reactive_power, type = "l", xlab = "datetime")    
  })
  
  dev.off()  
  
}