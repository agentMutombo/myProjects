# Read data from file for specific dates
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset data for specific dates
data_sub <- subset(data, as.Date(data$DateTime) %in% as.Date(c("2007-02-01", "2007-02-02")))

# Create plot of Global Active Power usage over time using base R plotting
plot(data_sub$DateTime, data_sub$Global_active_power, type = "l", xlab = "Time", ylab = "Global Active Power (kilowatts)")

# Save plot to PNG file
png("plot2.png", width = 480, height = 480)
plot(data_sub$DateTime, data_sub$Global_active_power, type = "l", xlab = "Time", ylab = "Global Active Power (kilowatts)")
dev.off()
