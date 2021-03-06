# This script takes data on power consumption "household_power_consumption.txt" from the local directory, formats the date and time fields and then produces a line chart in a png file.

# Read data that match required dates
data <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))

# Convert Date and Time variables to Date/Time classes
data$DateTime <- as.POSIXct(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")

# Plot line chart
png(filename="plot2.png", width=480, height=480)
plot(data$DateTime, 
     data$Global_active_power, 
     type="l",
     col="black", 
     xlab="", 
     ylab="Global Active Power (kilowatts)", 
     main="")
dev.off()