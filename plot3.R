# reading data file
data <- read.table("household_power_consumption.txt", header =  T,
                   na.strings = "?", sep = ";")

names(data) <- make.names(names(data))

#filter data frame
library(dplyr)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#transfer data and time column
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")

#now draw plot
names(data)
png("plot3.png")
with(data,{
  plot(Time,Sub_metering_1, type = "n",
       ylab = "Energy sub metering", xlab = "")
  lines(Time, Sub_metering_1, col = "black")
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1,lwd = 2,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()