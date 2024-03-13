getwd()
library("data.table")

#puts .txt file into data.table format and then identifies missing values, aka "?"
data <- data.table::fread(input = "household_power_consumption.txt"     
                          , na.strings="?"
)

#Convert Date-time to R classes
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filter Dates to only include time period: 2007-02-01 to 2007-02-03
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Constructing a PNG file with a width of 480 pixels and a height of 480 pixels to put Plot 3 in
png("plot3.png", w=480, h=480)

#Constructing Plot 3
plot(data[, dateTime], data[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data[, dateTime], data[, Sub_metering_2],col="red")
lines(data[, dateTime], data[, Sub_metering_3],col="blue")

#Creating legend on the top right, labeling each Sub_Metering line
legend("topright"
       , col = c("black", "red", "blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))   

#Explicitly closed graphics device
dev.off()