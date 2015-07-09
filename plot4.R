##An R Script to produce fourth plot of electric power consumption data.
##Course Project 1 for Exploratory Data Analysis MOOC July 2015
##Assumes the data file is unzipped in the working directory.

##An R Script to produce third plot of electric power consumption data.
##Course Project 1 for Exploratory Data Analysis MOOC July 2015
##Assumes the data file is unzipped in the working directory.

##Read the data into R.
BigData<-read.table("household_power_consumption.txt",sep=";", header=TRUE, na.strings = "?")

##Get rid of most of the unnecessary data.
##Specifically, keep only data for 2007-02-01 and 2007-02-02.
SmallerData<-BigData[BigData$Date == "1/2/2007" | BigData$Date == "2/2/2007",]

##To Save memory
rm(BigData)

##Redo the Date Factors for easier plotting, just two dates left.
SmallerData$Date<-factor(SmallerData$Date)

##Create an index that puts data points in the proper order
SmallerData<-cbind(SmallerData,Index=c(1:2880))

##Open a png device.
png("plot4.png")

##Set Params for plotting to make 2x2 plot

par(mfcol = c(2, 2))

## Generate first plot without xAxis
with(SmallerData, plot(Index,Global_active_power, type="l", 
                       ylab="Global Active Power (kilowatts)", xlab="", xaxt='n'))

##Add axis ticks at start (Thu), middle (Fri), and end (Sat)
axis(side=1, at=c(0,1441,2880), labels=(c("Thu","Fri","Sat")))

##Generate second plot with sub meter 1
with(SmallerData,plot(Index,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt='n'))

##Add Sub Meter 2 in red.
with(SmallerData, lines(Index,Sub_metering_2, col="red"))

##Add Sub meter 3 in blue
with(SmallerData, lines(Index,Sub_metering_3, col="blue"))

##Add axis ticks at start (Thu), middle (Fri), and end (Sat)
axis(side=1, at=c(0,1441,2880), labels=(c("Thu","Fri","Sat")))

##Add Legend
legend("topright", bty = "n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1))

## Generate third plot without xAxis
with(SmallerData, plot(Index,Voltage, type="l", 
                       ylab="Voltage", xlab="datetime", xaxt='n'))

##Add axis ticks at start (Thu), middle (Fri), and end (Sat)
axis(side=1, at=c(0,1441,2880), labels=(c("Thu","Fri","Sat")))

## Generate fourth plot without xAxis
with(SmallerData, plot(Index,Global_reactive_power, type="l", 
                       ylab="Global_reactive_power", xlab="datetime", xaxt='n'))

##Add axis ticks at start (Thu), middle (Fri), and end (Sat)
axis(side=1, at=c(0,1441,2880), labels=(c("Thu","Fri","Sat")))

##Close and save
dev.off()

