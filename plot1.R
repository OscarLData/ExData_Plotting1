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

png(filename = "plot1.png", width =480,height =480, units = "px")

hist(rawdata2$Global_active_power, 
     breaks = seq(0,8,by=0.5), 
     main= "Global Active Power",
     col ="red",
     xlab = "Global Active Power (kilowatts)",
     xaxt = 'n',
     yaxt = 'n'
    )
axis(side=1 ,at = seq(0,6, by = 2))
axis(side=2 ,at = seq(0,1200, by = 200))
dev.off()
