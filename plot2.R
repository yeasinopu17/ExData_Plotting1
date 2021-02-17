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
with(data, plot(Time, Global_active_power, type = "l", xlab = "", 
                ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2.png")
dev.off()

