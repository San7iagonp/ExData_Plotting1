Power <-  read.csv("household_power_consumption.txt", 
                   header=T, 
                   sep=";", 
                   na.strings="?")

Power$Time <- strptime(paste(Power$Date,Power$Time), format="%d/%m/%Y %H:%M:%S")

Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")

NewPower <- subset(Power, Date== "2007-02-01" |  Date== "2007-02-02")

png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(NewPower$Time, NewPower$Global_active_power, type="l", ylab="Global Active Power", xlab="") 
plot(NewPower$Time, NewPower$Voltage, type="l", ylab="Voltage", xlab="datetime") 
plot(NewPower$Time, NewPower$Sub_metering_1, xlab="", type="l", ylab="Energy sub metering")
lines(NewPower$Time, NewPower$Sub_metering_2, xlab="", col="red")
lines(NewPower$Time, NewPower$Sub_metering_3, xlab="", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
plot(NewPower$Time, NewPower$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime") 
dev.off()