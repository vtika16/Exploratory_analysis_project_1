##setting directory to set data##
setwd("/Users/vtika/Desktop/R Programming/Exploratory Analysis/Week 1 Assignment/")


##getting dataset loaded##
total_data <- read.csv("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings = "?", nrows = 2075259, quote = '\"')

##subsetting dataset##
subset_data <- total_data[total_data$Date %in% c("1/2/2007","2/2/2007") ,]

##format date/time and globalactivepower to appropriate field types##
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subset_data$Global_active_power)

##format sub meterings to numeric values##
subMetering1 <- as.numeric(subset_data$Sub_metering_1)
subMetering2 <- as.numeric(subset_data$Sub_metering_2)
subMetering3 <- as.numeric(subset_data$Sub_metering_3)

##create plot and png file##
png("plot3.png", width = 480, height = 480)
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col="red")
lines(datetime, subMetering3, type = "l", col="blue")
legend("topright", c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()