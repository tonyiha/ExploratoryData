setwd("C:\\Coursera\\Exploratory Data Analysis\\Wk1\\household_power_consumption")
library(sqldf)

hh_power_consumption <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)

hh_power_consumption$Date <- as.Date(hh_power_consumption$Date,"%d/%m/%Y")
hh_power_consumption$Time <- paste(hh_power_consumption$Date, hh_power_consumption$Time)
hh_power_consumption$Time <- strptime(hh_power_consumption$Time, format = "%Y-%m-%d %H:%M:%S")
par(mar=c(4.1, 5.1, 1.1, 2.1))
plot(hh_power_consumption$Time, hh_power_consumption$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", main="",
     type="l")