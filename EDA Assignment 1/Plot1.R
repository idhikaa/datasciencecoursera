source("/Users/idhikajakhetiya/Desktop/R programming/EDA Assignment 1/util.R")

dataset_time = return_dataset()
household_data = dataset_time[[1]]

png(file = "/Users/idhikajakhetiya/Desktop/R programming/EDA Assignment 1/plot1.png",width = 480, height = 480)
par(mfrow = c(1,1))
hist(household_data$Global_active_power,main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", col = "red")
dev.off()

