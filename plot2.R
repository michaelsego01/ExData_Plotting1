library("data.table")  
getwd()   #confirm working directory is still plotting1

#puts .txt file into data.table format and then identifies missing values, aka "?"
data <- data.table::fread(input = "household_power_consumption.txt"     
                          , na.strings="?"
)

#Convert Date-time to R classes
data[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#Filter Dates to only include time period: 2007-02-01 to 2007-02-03
data <- data[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

#Constructing a PNG file with a width of 480 pixels and a height of 480 pixels to put Plot 2 in
png("plot2.png", w=480, h=480)

#Constructing Plot 2 
plot(x = data[, dateTime]
     , y = data[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Explicitly closed graphics device
dev.off()