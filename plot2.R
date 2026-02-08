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

png("plot2.png", width = 480, height = 480)
plot(subset$datetime, subset$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

