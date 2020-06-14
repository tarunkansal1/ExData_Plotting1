data <- read.table("dataelec.txt",sep = ";",header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Global_active_power <- as.numeric(data$Global_active_power)


##open file device
png(filename = "plot1.png",width = 480,height = 480)
hist(data$Global_active_power,col="red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()