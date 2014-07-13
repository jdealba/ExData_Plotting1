##PLOT 4

##This script creates the "Plot 4" graph of the Coursera´s Exploratory
##Data Analysis - Project 1.

##First, reads the text file into data frame, this may take several seconds 
##depending on the speed of your computer. The archive household_power_consumption.txt
## must be located directly in the workingfolder.
powerConsuption <- read.table(file="./household_power_consumption.txt", sep=";",
                              header=TRUE,na.strings="?",stringsAsFactors=FALSE);
##Changes Date column into Date type.
powerConsuption$Date <- as.Date(powerConsuption$Date, format="%d/%m/%Y");

##Obtains only the data between 1st and 2nd - February - 2007
plottingData <- powerConsuption[powerConsuption$Date %in% 
                                        as.Date(c("2007-02-01","2007-02-02")), ];

##Obtains the number of rows of the dataset. This will be used to draw the x axis. 
dataLen <- nrow(plottingData)
#Configure the resulting png of the plot, setting name, width and height of 
##480 pixels and white backgound color.
png("plot4.png",width=480,height=480, bg="white");
##Configure the number of plots that the script will show in the png. In this case
## the final graph contains 4 plot.
par(mfrow=c(2,2))

##Generates the first plot of the archive using the plot() function.
plot(plottingData$Global_active_power, type="l",xlab=" ", 
     ylab= "Global Active Power",axes=FALSE, ann=TRUE)
box("plot")
axis(1,at=c(0,dataLen/2,dataLen), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,2,4,6))

##Generates the second plot of the archive using the plot function and the Voltage column 
##of the DataFrame
plot(plottingData$Voltage, type="l",xlab="datetime", ylab= "Voltage",axes=FALSE, ann=TRUE);
box("plot")
axis(1,at=c(0,dataLen/2,dataLen), lab=c("Thu","Fri","Sat"))
axis(2, at=c(234,236,238,240,242,244,246), lab = c("234"," ","238"," ","242"," ","246"))

##Generates the third plot of the archive using the plot and lines functions and
##the sub_metering columns of the dataframe. 
plot(plottingData$Sub_metering_1, type="n",xlab=" ", ylab= "Energy sub metering",axes=FALSE, ann=TRUE)
box("plot")
axis(1,at=c(0,dataLen/2,dataLen), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0,10,20,30))
lines(plottingData$Sub_metering_1,col="black")
lines(plottingData$Sub_metering_2,col="red")
lines(plottingData$Sub_metering_3,col="blue")
legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"), lwd=1, lty=c(1,1,1)
)

##Generates The forth plot of the archive using the plot function and the 
##Global_reactive_power column of the DataFrame.
plot(plottingData$Global_reactive_power, type="l",xlab="datetime", ylab= "Global_reactive_power",axes=FALSE, ann=TRUE)
box("plot")
axis(1,at=c(0,dataLen/2,dataLen), lab=c("Thu","Fri","Sat"))
axis(2, at=c(0.0,0.1,0.2,0.3,0.4,0.5))
##finish the sript sending the plot to the png.
dev.off();
