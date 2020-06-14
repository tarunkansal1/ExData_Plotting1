data <- read.table("dataelec.txt",sep = ";",header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##open file device
png(filename = "plot3.png",width = 480,height = 480)
plot(datetime,data$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = "")
lines(datetime,data$Sub_metering_2,type = "l",col = "red" )
lines(datetime,data$Sub_metering_3,type = "l",col = "blue" )
legend("topright",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       ,lty = 1)
dev.off()