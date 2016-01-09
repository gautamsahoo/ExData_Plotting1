#Reading the data into a dataframe
hh <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", quote = "",stringsAsFactors = FALSE);
#Creating another dataframe after converting date column into a date format.

library(lubridate);

old_names <- names(hh);
hh <- cbind(as.Date(hh$Date,"%d/ %m/ %Y"),hh[,2:9]);

names(hh) <- old_names;

plotSubSet <- subset(hh, Date == "2007-02-01" | Date == "2007-02-02");


#Setup datatypes for various metrices to be plotted.
xAxis <- paste(plotSubSet$Date, plotSubSet$Time, sep=" ");
xAxis <- strptime(xAxis, "%Y-%m-%d %H:%M:%S");

yAxis1 <- as.numeric(plotSubSet$Global_active_power);
yAxis2 <- as.numeric(plotSubSet$Voltage);
yAxis3.1 <- as.numeric(plotSubSet$Sub_metering_1);
yAxis3.2 <- as.numeric(plotSubSet$Sub_metering_2);
yAxis3.3 <- as.numeric(plotSubSet$Sub_metering_3);
yAxis4 <- as.numeric(plotSubSet$Global_reactive_power);



png("plot4.png", width=480, height=480);

#Set the plotting window so that it can accomodate 4 plots.
par(mfrow = c(2, 2));

#Plot#1 below
plot(xAxis,yAxis1,type = "l", xlab = "",ylab = "Global Active Power");

#Plot#2 below
plot(xAxis,yAxis2,type = "l", xlab = "datetime",ylab = "Voltage");

#Plot#3 below
plot(xAxis,yAxis3.1,type = "l", xlab = "",ylab = "Energy Sub Metering",bty = "o");
lines(xAxis, yAxis3.2, type="l", col="red");
lines(xAxis, yAxis3.3, type="l", col="blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"),bty = "o");

#Plot#4 below
plot(xAxis,yAxis4,type = "l", xlab = "datetime",ylab = "Global reactive Power");

dev.off();
