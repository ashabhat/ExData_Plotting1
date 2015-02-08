plot1 <- function () {
  
  library(sqldf)
  
  input_data <- read.csv.sql("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

  png(file = "plot1.png", width = 480, height = 480)
  
  with(input_data, hist(Global_active_power, col = "red", xlab = "Global_active_power(kilowatts)", main = "Global Active Power"))
  
  dev.off()  

}