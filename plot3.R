Sys.setlocale("LC_TIME", "C")

# Read data from file
data <- read.csv2("./household_power_consumption.txt", colClasses="character")

# Convert date strings to Date classes 
data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")

# Subset data
sample_daterange = as.Date(c("2007-02-01","2007-02-02"))
sample_data = subset(data, data[,"Date"] %in% sample_daterange)

# Convert data for data axis to numeric
sample_data[,"Sub_metering_1"] <- as.numeric(sample_data[,"Sub_metering_1"])
sample_data[,"Sub_metering_2"] <- as.numeric(sample_data[,"Sub_metering_2"])
sample_data[,"Sub_metering_3"] <- as.numeric(sample_data[,"Sub_metering_3"])

# Add DateTime column for time axis
sample_data[,"DateTime"] <- paste(sample_data[,"Date"], sample_data[,"Time"], sep=" ")

# Build plot
png("plot3.png", width=480, height=480)

plot(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Sub_metering_1"], type="l", 
     xlab="", ylab="Energy sub metering")

# Add the rest of submetering
lines(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Sub_metering_2"], col="Red")
lines(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Sub_metering_3"], col="Blue") 

# Build plot legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("Black", "Red", "Blue"), lwd=1)

dev.off()

