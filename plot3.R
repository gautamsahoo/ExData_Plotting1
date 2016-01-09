#Reading the data into a dataframe
hh <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", quote = "",stringsAsFactors = FALSE);
#Creating another dataframe after converting date column into a date format.

library(lubridate);

old_names <- names(hh);
hh <- cbind(as.Date(hh$Date,"%d/ %m/ %Y"),hh[,2:9]);

names(hh) <- old_names;

plotSubSet <- subset(hh, Date == "2007-02-01" | Date == "2007-02-02");

xAxis <- paste(plotSubSet$Date, plotSubSet$Time, sep=" ");
xAxis <- strptime(xAxis, "%Y-%m-%d %H:%M:%S");

yAxis1 <- as.numeric(plotSubSet$Sub_metering_1);
yAxis2 <- as.numeric(plotSubSet$Sub_metering_2);
yAxis3 <- as.numeric(plotSubSet$Sub_metering_3);

png("plot3.png", width=480, height=480);
plot(xAxis, yAxis1, type="l", ylab="Energy Submetering", xlab="");

lines(xAxis, yAxis2, type="l", col="red");
lines(xAxis, yAxis3, type="l", col="blue");
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"));
dev.off();