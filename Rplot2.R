#dt <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
#dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
#dt <- dt[(dt$Date == "2007-02-01"|dt$Date == "2007-02-02"),]
#dt$Time <- strptime(paste(dt$Date,dt$Time), "%Y-%m-%d %H:%M:%S")
with(dt,
     plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
    )
