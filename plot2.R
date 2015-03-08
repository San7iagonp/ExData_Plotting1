Power <-  read.csv("household_power_consumption.txt", 
                   header=T, 
                   sep=";", 
                   na.strings="?")

Power$Time <- strptime(paste(Power$Date,Power$Time), format="%d/%m/%Y %H:%M:%S")

Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")

NewPower <- subset(Power, Date== "2007-02-01" |  Date== "2007-02-02")

png("plot2.png")
plot(NewPower$Time, NewPower$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
dev.off()