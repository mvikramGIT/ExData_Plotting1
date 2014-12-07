#dt <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
#dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
#dt <- dt[(dt$Date == "2007-02-01"|dt$Date == "2007-02-02"),]
#dt$Time <- strptime(paste(dt$Date,dt$Time), "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
hist(as.numeric(dt$Global_active_power),
     main="",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200),
     col = "Red",
     xaxt ="n"
)
axis(1,at=c(0,2,4,6))
axis(1,at=c(0,2,4,6))
with(dt,plot(Time, Voltage, type ="l", xlab = "datetime"))
with(dt,{
     plot(Time, Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
     lines(Time, Sub_metering_2, col ="Red")
     lines(Time, Sub_metering_3, col = "Blue")
}
    )
legend("topright", lty =1, cex= 0.5,
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("Black", "Red", "Blue"))
with(dt,plot(Time,Global_reactive_power,type="l", xlab="datetime"))
