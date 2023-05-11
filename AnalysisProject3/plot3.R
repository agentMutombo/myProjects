# Read data from file
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", header =
                     TRUE, stringsAsFactors = FALSE)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset data for specific dates
data_sub <- subset(data, as.Date(data$DateTime) %in% as.Date(c("2007-02-01", "2007-02-02")))

# Create plot of Energy Sub Metering
plot(data_sub$DateTime, data_sub$Sub_metering_1, type = "l", col = "black", xlab = "Time",
     ylab = "Energy Sub Metering (Watt-hour)")
lines(data_sub$DateTime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$DateTime, data_sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

# Save plot to PNG file
png("plot3.png", width = 480, height = 480)

plot(data_sub$DateTime, data_sub$Sub_metering_1, type = "l", col = "black", xlab = "Time",
     ylab = "Energy Sub Metering (Watt-hour)")
lines(data_sub$DateTime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$DateTime, data_sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

dev.off()
