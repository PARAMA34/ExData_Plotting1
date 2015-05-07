# Set working directory

setwd("C:/Parama/coursera/Exploratory_Data_Analysis/Project1")

# Load the data file and read it

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp) ## delete the temporary file 
}
power <- read.table(file, header=T, sep=";", stringsAsFactors=FALSE)
dataSet <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(as.character(dataSet$Global_active_power))
datetime <- strptime(paste(dataSet$Date, dataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(as.character(dataSet$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(dataSet$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(dataSet$Sub_metering_3))

#Plot the graph 

png("plot3.png", width=480, height=480)
plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()