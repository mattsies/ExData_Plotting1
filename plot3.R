setwd("/Users/matt/r/ExploratoryDataAnalysis")
myData <- read.table("household_power_consumption.txt",skip=66638 ,nrows=4319,  sep =';' )
colnames(myData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
myData$Date <- strptime(myData$Date, format= "%d/%m/%Y")
myData$dateTime <- with(myData, as.POSIXct(paste(myData$Date, myData$Time)), format="%d/%m/%Y %H:%M:%S")
head(myData)

# Plot 3
a <- myData$dateTime
b <- myData$Sub_metering_1
c <- myData$Sub_metering_2
d <- myData$Sub_metering_3
with(myData, plot(a, b, type='l',ylab="Global Active Power (kilowatts)"))
with(myData, lines(a, c, col='red3'))
with(myData, lines(a, d, col='blue2'))
legend("topright", lty = 1, col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
