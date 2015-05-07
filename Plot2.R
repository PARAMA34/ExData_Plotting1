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

#Plot the graph 

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()