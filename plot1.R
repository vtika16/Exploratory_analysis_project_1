
##setting directory to set data##
setwd("/Users/vtika/Desktop/R Programming/Exploratory Analysis/Week 1 Assignment/")


##getting dataset loaded##
total_data <- read.csv("exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings = "?", nrows = 2075259, quote = '\"')

##subsetting the dataset
subset <- total_data[total_data$Date %in% c("1/2/2007","2/2/2007") ,]

##conversion of dates##
globalActivePower <- as.numeric(subset$Global_active_power)

##create the histogram##
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col="red", main="Globabl Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
