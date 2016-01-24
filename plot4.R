setwd("/Users/matt/r/ExploratoryDataAnalysis")
myData <- read.table("household_power_consumption.txt",skip=66638 ,nrows=4319,  sep =';' )
colnames(myData) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
myData$Date <- strptime(myData$Date, format= "%d/%m/%Y")
myData$dateTime <- with(myData, as.POSIXct(paste(myData$Date, myData$Time)), format="%d/%m/%Y %H:%M:%S")
head(myData)

# Plot 4
par(mfrow = c(2,2))
# Subplot 1
plot(myData$dateTime,myData$Global_active_power, type = "l",  ylab="Global Active Power (kilowatts)", xlab = " ")

# Subplot 2
plot(myData$dateTime,myData$Voltage, type = "l",  ylab="Voltage", xlab = "datetime")

# Subplot 3
with(myData, plot(myData$dateTime, myData$Sub_metering_1, type='l',ylab="Energy sub metering", xlab = ""))
with(myData, lines(myData$dateTime, myData$Sub_metering_2, col='red3'))
with(myData, lines(myData$dateTime, myData$Sub_metering_3, col='blue2'))
legend("topright", lty = 1,col = c("black","blue","red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# Subplot 4
plot(myData$dateTime,myData$Global_reactive_power, type = "l",  ylab="Global Reactive Power (kilowatts)", xlab = "datetime")


