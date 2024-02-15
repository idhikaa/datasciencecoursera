library(dplyr)

return_dataset <- function(){
  filename = "/Users/idhikajakhetiya/Desktop/R programming/EDA Assignment 1/household_power_consumption.txt"
  household_data_test = read.table(filename, nrows = 1, sep = ";", header = TRUE)
  first_date = household_data_test$Date
  first_time = household_data_test$Time
  
  # to find beginning date-time-row
  date_file_start = strptime(paste(first_date, first_time), format = "%d/%m/%Y %H:%M:%S")
  date_time_begin = strptime("1/2/2007", format = "%d/%m/%Y")
  difference1 = difftime(date_time_begin, date_file_start, units = "min")
  
  # to find last row
  date_time_end = strptime("3/2/2007", format = "%d/%m/%Y")
  difference2 = difftime(date_time_end, date_time_begin, units = "min")
  
  # read in data
  household_data = read.table(filename, nrows = difference2, sep = ";", header = TRUE, skip = difference1, col.names = names(household_data_test))
  
  first_date = household_data$Date
  first_time = household_data$Time
  date_time = strptime(paste(first_date, first_time), format = "%d/%m/%Y %H:%M:%S")
  
  household_data = select(household_data, -(Date:Time))  
  return(list(household_data, date_time))
}
dataset_time = return_dataset()
household_data = dataset_time[[1]]
date_time = dataset_time[[2]]


png(file = "/Users/idhikajakhetiya/Desktop/R programming/EDA Assignment 1/plot2.png",width = 480, height = 480)
par(mfrow = c(1,1))
plot(date_time, household_data$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "datetime")
title(main = "Global Active Power Over Time")
dev.off()