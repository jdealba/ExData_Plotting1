## PLOT 1

##This script creates the Plot 1 graph of the Coursera´s Exploratory
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

##Configure the resulting png of the plot 1, with width and height of 480
##pixels and white backgound color.
png("plot1.png",width=480,height=480, bg="white");
##Configure the number of plots that the script will show in the png.
par(mfrow=c(1,1))
##Generate the Plot 1 using hist() function and Global_active_power Column 
##of the dataset.
hist(plottingData$Global_active_power, xlab= "Global Active Power (kilowatts)",
     ylab="Frequency", col="red", main="Global Active Power");
##finish the sript sending the plot to the png.
dev.off();
