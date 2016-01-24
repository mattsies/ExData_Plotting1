setwd("/Users/matt/r/ExploratoryDataAnalysis")
myData <- read.table("household_power_consumption.txt",skip=66638 ,nrows=4319,  sep =';' )
colnames(myData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
myData$Date <- strptime(myData$Date, format= "%d/%m/%Y")
myData$dateTime <- with(myData, as.POSIXct(paste(myData$Date, myData$Time)), format="%d/%m/%Y %H:%M:%S")
head(myData)

# Plot 1 
hist(myData$Global_active_power, col = "red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     ylab = "Frequency")