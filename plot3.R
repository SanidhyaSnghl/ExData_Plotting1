data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
subset <- data[data$Date %in% c("2007-02-01", "2007-02-02"), ]
subset$datetime <- strptime(
  paste(subset$Date, subset$Time),
  "%Y-%m-%d %H:%M:%S"
)

png("plot3.png", width = 480, height = 480)

plot(subset$datetime, subset$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "")

lines(subset$datetime, subset$Sub_metering_2, col = "red")
lines(subset$datetime, subset$Sub_metering_3, col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

dev.off()

