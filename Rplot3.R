# Runs with the file househole_power_consumption.txt in the working folder
# file downloaded from :
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
dt <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
dt$Date <- as.Date(dt$Date, "%d/%m/%Y") # Parse dates
dt <- dt[(dt$Date == "2007-02-01"|dt$Date == "2007-02-02"),] # Selected two days from dataset
dt$Time <- strptime(paste(dt$Date,dt$Time), "%Y-%m-%d %H:%M:%S") # Parse datetime

with(dt,{
     plot(Time, Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
     lines(Time, Sub_metering_2, col ="Red")
     lines(Time, Sub_metering_3, col = "Blue")
}
    )
legend("topright", lty =1, 
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"))
dev.copy(png, file = "plot3.png",width = 480, height = 480)
dev.off()