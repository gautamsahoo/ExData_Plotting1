#Reading the data into a dataframe 
hh <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", quote = "",stringsAsFactors = FALSE);
#Creating another dataframe after converting date column into a date format.

library(lubridate);

old_names <- names(hh);
hh <- cbind(as.Date(hh$Date,"%d/ %m/ %Y"),hh[,2:9]);

names(hh) <- old_names;

#Creating another dataset for the two required days
hh1 <- subset(hh, Date == "2007-02-01" | Date == "2007-02-02");


#Convert the datatypes of the numeric columns from char to numeric
hh2 <- transform(hh1, Global_active_power = as.numeric(Global_active_power), 
                 Global_reactive_power = as.numeric(Global_reactive_power),
                 Voltage = as.numeric(Voltage),Global_intensity = as.numeric(Global_intensity),
                 Sub_metering_1 = as.numeric(Sub_metering_1), 
                 Sub_metering_2 = as.numeric(Sub_metering_2),
                 Sub_metering_3 = as.numeric(Sub_metering_3));

#Plot the histograph into a png file.
png("plot1.png",width = 480,height = 480);
hist(hh2[,3],xlab = "Global Active Power (killowatts)",main = "Global Active Power", col = "red");
dev.off();









