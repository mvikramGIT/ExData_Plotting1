# Runs with the file househole_power_consumption.txt in the working folder
# file downloaded from :
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
dt <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
dt$Date <- as.Date(dt$Date, "%d/%m/%Y") # Parse dates
dt <- dt[(dt$Date == "2007-02-01"|dt$Date == "2007-02-02"),] # Selected two days from dataset
dt$Time <- strptime(paste(dt$Date,dt$Time), "%Y-%m-%d %H:%M:%S") # Parse datetime
par(mfrow = c(2,2))
with(dt,
     plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab ="")
)
with(dt,plot(Time, Voltage, type ="l", xlab = "datetime"))
with(dt,{
     plot(Time, Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
     lines(Time, Sub_metering_2, col ="Red")
     lines(Time, Sub_metering_3, col = "Blue")
}
    )
legend("topright", lty =1, cex= 0.8, bty = "n",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"))
with(dt,plot(Time,Global_reactive_power,type="l", xlab="datetime"))
dev.copy(png, file = "plot4.png",width = 480, height = 480)
dev.off()