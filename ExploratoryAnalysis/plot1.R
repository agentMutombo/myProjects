# Read data from file for specific dates
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Subset data for specific dates
data_sub <- subset(data, as.Date(data$DateTime) %in% as.Date(c("2007-02-01", "2007-02-02")))

# Create histogram of Global Active Power usage
hist(data_sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kW)", ylab = "Frequency",  col = "red")

png("plot1.png", width = 480, height = 480)
hist(data_sub$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kW)", ylab = "Frequency",  col = "red")
dev.off()
