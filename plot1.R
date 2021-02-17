# reading data file
data <- read.table("household_power_consumption.txt", header =  T,
                 na.strings = "?", sep = ";")
names(data) <- make.names(names(data))

#filter data frame
library(dplyr)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# draw histogram
with(data, hist(Global_reactive_power, col = "red", 
                main = "Global Active Power", 
                xlab = "Global Active Power(kilowatts)"))
dev.copy(png, file = "plot1.png")
dev.off()
