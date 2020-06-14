data <- read.table("dataelec.txt",sep = ";",header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Global_active_power <- as.numeric(data$Global_active_power)

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
##open file device
png(filename = "plot2.png",width = 480,height = 480)
plot(datetime,data$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()