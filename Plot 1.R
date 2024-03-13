dir.create("plotting1") 
setwd("plotting1")
getwd() #confirm working directory

#Unzipping file

uzp <- "C:/Users/micha/OneDrive/Desktop/exdata_data_household_power_consumption.zip" #copied path name of compressed zip file then assigned path to variable, "uzp"

unzip(uzp, exdir= "C:/Users/micha/OneDrive/Documents/plotting1") #unzipped variable, "uzp" in the plotting1 directory, aka the current working directory

install.packages("data.table")
library("data.table")         #installed and loaded data.table package 


#puts .txt file into data.table format and then identifies missing values, aka "?"
data <- data.table::fread(input = "household_power_consumption.txt"     
                                , na.strings="?"
                                  )

#Changing Date column into Data class
data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Filter Dates to only include time period: 2007-02-01 to 2007-02-02
data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

#Constructing a PNG file with a width of 480 pixels and a height of 480 pixels to put Plot 1 in
png(file = "plot1.png", w=480, h=480)

#Constructing Plot 1 to be placed in plot1.png
hist(data [, Global_active_power], main="Global Active Power",
  xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Explicitly closed graphics device
dev.off()




