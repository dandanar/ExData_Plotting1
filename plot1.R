##An R Script to produce plots of electric power consumption data.
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

##Open a png device.
png("plot1.png")

##Plot that is a histogram of Global Active Power var.

hist(SmallerData$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="red")
##Add in some extra axis ticks.
axis(2, c(200,600,1000))

##Close and save.
dev.off()

