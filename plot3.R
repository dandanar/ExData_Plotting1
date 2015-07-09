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
png("plot3.png")

##Generate initial plot with sub meter 1
with(SmallerData,plot(Index,Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", xaxt='n'))

##Add Sub Meter 2 in red.
with(SmallerData, lines(Index,Sub_metering_2, col="red"))

##Add Sub meter 3 in blue
with(SmallerData, lines(Index,Sub_metering_3, col="blue"))

##Add axis ticks at start (Thu), middle (Fri), and end (Sat)
axis(side=1, at=c(0,1441,2880), labels=(c("Thu","Fri","Sat")))

##Add Legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty=c(1,1))

##Close and save
dev.off()

