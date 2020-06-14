data <- read.table("dataelec.txt",sep = ";",header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]



#converting to numeric..
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)



datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##open file device
png(filename = "plot4.png",width = 480,height = 480)
par( mfrow = c(2,2))
plot(datetime,data$Global_active_power,type="l",ylab = "Global Active Power",xlab = "")
plot(datetime,data$Voltage,type="l",ylab = "Voltage",xlab = "datetime")
plot(datetime,data$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = "")
lines(datetime,data$Sub_metering_2,type = "l",col = "red" )
lines(datetime,data$Sub_metering_3,type = "l",col = "blue" )
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty = ,lwd = 2.5,bty = "o")
plot(datetime,data$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()