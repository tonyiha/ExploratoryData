setwd("C:\\Coursera\\Exploratory Data Analysis\\Wk1\\household_power_consumption")
library(sqldf)

hh_power_consumption <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)

hh_power_consumption$Date <- as.Date(hh_power_consumption$Date,"%d/%m/%Y")
hh_power_consumption$Time <- strptime(hh_power_consumption$Time, "is%H:%M:%S")
par(mar=c(4.1, 4.1, 1.1, 2.1))
hist(hh_power_consumption$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")