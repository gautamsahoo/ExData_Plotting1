#Reading the data into a dataframe 
hh <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", quote = "",stringsAsFactors = FALSE);
#Creating another dataframe after converting date column into a date format.

library(lubridate);

old_names <- names(hh);
hh <- cbind(as.Date(hh$Date,"%d/ %m/ %Y"),hh[,2:9]);

names(hh) <- old_names;

plot2SubSet <- subset(hh, Date == "2007-02-01" | Date == "2007-02-02");

xAxis <- paste(plot2SubSet$Date, plot2SubSet$Time, sep=" ");
xAxis <- strptime(xAxis, "%Y-%m-%d %H:%M:%S");


yAxis <- as.numeric(plot2SubSet$Global_active_power);
png("plo2.png", width=480, height=480);
plot(xAxis, yAxis, type="l", xlab="", ylab="Global Active Power (kilowatts)");
dev.off();



