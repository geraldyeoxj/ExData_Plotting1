# This script takes data on power consumption "household_power_consumption.txt" from the local directory, formats the date and time fields and then produces a histogram in a png file.

# Read data that match required dates
data <- read.csv("household_power_consumption.txt", 
                 skip=66637,
                 nrows=2880,
                 na.strings = "?",
                 header=F,
                 sep=";")
names(data) <- names(read.csv("household_power_consumption.txt", nrows=1,sep=";"))

# Convert Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format="%d/%m/%y")
data$Time <- strptime(data$Time, format="%H:%M:%S")

# Plot histogram 
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()