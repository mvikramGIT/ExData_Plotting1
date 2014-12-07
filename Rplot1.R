#dt <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
#dt$Date <- as.Date(dt$Date, "%d/%m/%Y")
#dt <- dt[(dt$Date == "2007-02-01"|dt$Date == "2007-02-02"),]
#dt$Time <- strptime(paste(dt$Date,dt$Time), "%Y-%m-%d %H:%M:%S")
hist(as.numeric(dt$Global_active_power),
     main ="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200),
     col = "Red",
     xaxt ="n"
     )
axis(1,at=c(0,2,4,6))