##An R Script to produce second plot of electric power consumption data.
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
png("plot2.png")

## Generate plot without xAxis
with(SmallerData, plot(Index,Global_active_power, type="l", 
                       ylab="Global Active Power (kilowatts)", xlab="", xaxt='n'))

##Add axis ticks at start (Thu), middle (Fri), and end (Sat)
axis(side=1, at=c(0,1441,2880), labels=(c("Thu","Fri","Sat")))

dev.off()
