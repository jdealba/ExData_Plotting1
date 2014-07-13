##PLOT 3

##This script creates the "Plot 3" graph of the Coursera´s Exploratory
##Data Analysis - Project 1

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
png("plot3.png",width=480,height=480, bg="white");
##Configure the number of plots that the script will show in the png.
par(mfrow=c(1,1))
##Draws only the annotations of the plot, because type is set to "No Plot".
plot(plottingData$Sub_metering_1, type="n",xlab=" ", ylab= "Energy sub metering",
     axes=FALSE, ann=TRUE)
##Draw the box of the plot.
box("plot")
##Draw the x axis using only 3 tick-marks.
axis(1,at=c(0,dataLen/2,dataLen), lab=c("Thu","Fri","Sat"))
##Draw the y axis using only 4 tick-marks.
axis(2, at=c(0,10,20,30))
##Draw the lines of Sub_metering_1 information in the plot.
lines(plottingData$Sub_metering_1,col="black")
##Draw the lines of Sub_metering_2 information in the plot.
lines(plottingData$Sub_metering_2,col="red")
##Draw the lines of Sub_metering_2 information in the plot.
lines(plottingData$Sub_metering_3,col="blue")
##Configure the legend of the plot.
legend( x="topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"), lwd=1, lty=c(1,1,1)
)
##finish the sript sending the plot to the png.
dev.off();