hpc <- read.csv("~/household_power_consumption.txt", sep=";") 
#read the file into R

data <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
#creates a sub dataset with only the 2 needed days

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(data$Global_active_power)

subM1 <- as.numeric(data$Sub_metering_1)
subM2 <- as.numeric(data$Sub_metering_2)
subM3 <- as.numeric(data$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subM2, type="l", col="red")
lines(datetime, subM3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()