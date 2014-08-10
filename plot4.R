Sys.setlocale("LC_TIME", "C")

# Read data from file
data <- read.csv2("./household_power_consumption.txt", colClasses="character")

# Convert date strings to Date classes 
data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")

# Subset data
sample_daterange = as.Date(c("2007-02-01","2007-02-02"))
sample_data = subset(data, data[,"Date"] %in% sample_daterange)

# Convert data for data axises to numeric
sample_data[,"Global_active_power"] <- as.numeric(sample_data[,"Global_active_power"])
sample_data[,"Voltage"] <- as.numeric(sample_data[,"Voltage"])
sample_data[,"Sub_metering_1"] <- as.numeric(sample_data[,"Sub_metering_1"])
sample_data[,"Sub_metering_2"] <- as.numeric(sample_data[,"Sub_metering_2"])
sample_data[,"Sub_metering_3"] <- as.numeric(sample_data[,"Sub_metering_3"])

# Add DateTime column for time axis
sample_data[,"DateTime"] <- paste(sample_data[,"Date"], sample_data[,"Time"], sep=" ")

# Build plots
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# First plot
plot(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Global_active_power"], type="l", 
     ylab="Global Active Power", xlab="")

# Second plot
plot(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Voltage"], type="l", 
     ylab="Voltage", xlab="datetime")

# Third plot
plot(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Sub_metering_1"], type="l", 
     xlab="", ylab="Energy sub metering")
lines(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Sub_metering_2"], col="Red")
lines(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Sub_metering_3"], col="Blue") 
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("Black", "Red", "Blue"), lwd=1, bty="n")

# Fourth plot
plot(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Global_reactive_power"], type="l", 
     ylab="Global_reactive_power", xlab="datetime")

dev.off()

