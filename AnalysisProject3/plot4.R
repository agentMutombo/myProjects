# Read data from file for specific dates
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.strings = "?", stringsAsFactors = FALSE,
                 colClasses = c("character", "character", "numeric", "numeric",
                                "numeric", "numeric", "numeric", "numeric", "numeric"))

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset data for specific dates
data_sub <- subset(data, as.Date(data$DateTime) %in% as.Date(c("2007-02-01", "2007-02-02")))




# Set up the layout for the four-panel plot
par(mfrow = c(2, 2))

# Create plot of Global Active Power usage over time
plot(data_sub$DateTime, data_sub$Global_active_power, type = "l", 
     xlab = "datetime", ylab = "Global Active Power (kW)")

# Create plot of Voltage over time
plot(data_sub$DateTime, data_sub$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage (V)")

# Create plot of Energy Sub Metering over time
plot(data_sub$DateTime, data_sub$Sub_metering_1, type = "l", col = "black", xlab = "datetime",
     ylab = "Energy Sub Metering (Watt-hour)")
lines(data_sub$DateTime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$DateTime, data_sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

# Create plot of Global Reactive Power usage over time
plot(data_sub$DateTime, data_sub$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power (kW)")

# Reset the layout to default
par(mfrow = c(1, 1))




# Save plot to PNG file
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Create plot of Global Active Power usage over time
plot(data_sub$DateTime, data_sub$Global_active_power, type = "l", 
     xlab = "datetime", ylab = "Global Active Power (kW)")

# Create plot of Voltage over time
plot(data_sub$DateTime, data_sub$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage (V)")

# Create plot of Energy Sub Metering over time
plot(data_sub$DateTime, data_sub$Sub_metering_1, type = "l", col = "black", xlab = "datetime",
     ylab = "Energy Sub Metering (Watt-hour)")
lines(data_sub$DateTime, data_sub$Sub_metering_2, col = "red")
lines(data_sub$DateTime, data_sub$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

# Create plot of Global Reactive Power usage over time
plot(data_sub$DateTime, data_sub$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power (kW)")

# Reset the layout to default
par(mfrow = c(1, 1))

dev.off()
