hpc <- read.csv("~/household_power_consumption.txt", sep=";") 
        #read the file into R

data <- hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
        #creates a sub dataset with only the 2 needed days

datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
