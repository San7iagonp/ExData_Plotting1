Power <-  read.csv("household_power_consumption.txt", 
                   header=T, 
                   sep=";", 
                   na.strings="?")

Power$Time <- strptime(paste(Power$Date,Power$Time), format="%d/%m/%Y %H:%M:%S")

Power$Date <- as.Date(Power$Date, format="%d/%m/%Y")

NewPower <- subset(Power, Date== "2007-02-01" |  Date== "2007-02-02")

png("plot3.png")
par(bg=NA) 
plot(NewPower$Time, NewPower$Sub_metering_1, xlab="", type="l", ylab="Energy sub metering")
lines(NewPower$Time, NewPower$Sub_metering_2, xlab="", col="red")
lines(NewPower$Time, NewPower$Sub_metering_3, xlab="", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()