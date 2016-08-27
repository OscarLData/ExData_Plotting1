setwd("C:/Users/OLKaE/Desktop/DataScienceCourse/EDA/Week1")

rawdata <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

rawdata[,1] <- as.Date(rawdata[,1], "%d/%m/%Y")
rawdata2 <- subset(rawdata, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

rawdata2[,3] <- as.numeric(rawdata2[,3])
rawdata2[,4] <- as.numeric(rawdata2[,4])
rawdata2[,5] <- as.numeric(rawdata2[,5])
rawdata2[,6] <- as.numeric(rawdata2[,6])
rawdata2[,7] <- as.numeric(rawdata2[,7])
rawdata2[,8] <- as.numeric(rawdata2[,8])
rawdata2[,9] <- as.numeric(rawdata2[,9])

datetime <- strptime(paste(rawdata2$Date,rawdata2$Time," "), format="%Y-%m-%d %H:%M:%S")

rawdata3 <- cbind(rawdata2,datetime)


png(filename = "plot3.png", width =480,height =480, units = "px")

plot(rawdata3$datetime, 
     rawdata3$Sub_metering_1,
     type="n",
     xlab = "" , 
     ylab = "Energy sub metering")
lines(rawdata3$datetime, rawdata3$Sub_metering_1, col = "black")
lines(rawdata3$datetime, rawdata3$Sub_metering_2, col = "red")
lines(rawdata3$datetime, rawdata3$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1)

dev.off()
