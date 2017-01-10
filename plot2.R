##setting the working directory##

setwd("/Users/vtika/Desktop/R Programming/Exploratory Analysis/Week 1 Assignment/")

##getting total data##
total_data <- read.csv("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", 
                                     na.strings = "?", nrows = 2075259, quote = '\"')
##subsetting dataset##
subset_data <- total_data[total_data$Date %in% c("1/2/2007","2/2/2007") ,]

##formattting date/time fields##
datetime <- strptime(paste(subset_data$Date, subset_data$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

##setting Kilowatts as numeric values prior to plotting##
globalActivePower <- as.numeric(subset_data$Global_active_power)

##create plot and png file##
png("plot2.png", width = 480, height = 480)
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()