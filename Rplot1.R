# Runs with the file household_power_consumption.txt in the working folder
# file downloaded from :
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
dt <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE)
dt$Date <- as.Date(dt$Date, "%d/%m/%Y") # Parse dates
dt <- dt[(dt$Date == "2007-02-01"|dt$Date == "2007-02-02"),] # Selected two days from dataset
dt$Time <- strptime(paste(dt$Date,dt$Time), "%Y-%m-%d %H:%M:%S") # Parse datetime
hist(as.numeric(dt$Global_active_power),
     main ="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylim = c(0,1200),
     col = "Red"
     )
dev.copy(png,file = "plot1.png",width = 480, height = 480)
dev.off()