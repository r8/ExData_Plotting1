Sys.setlocale("LC_TIME", "C")

# Read data from file
data <- read.csv2("./household_power_consumption.txt", colClasses="character")

# Convert date strings to Date classes 
data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")

# Subset data
sample_daterange = as.Date(c("2007-02-01","2007-02-02"))
sample_data = subset(data, data[,"Date"] %in% sample_daterange)

# Convert data for data axis to numeric
sample_data[,"Global_active_power"] <- as.numeric(sample_data[,"Global_active_power"])
# Add DateTime column for time axis
sample_data[,"DateTime"] <- paste(sample_data[,"Date"], sample_data[,"Time"], sep=" ")

# Build plot
png("plot2.png", width=480, height=480)
plot(as.POSIXct(sample_data[,"DateTime"]), sample_data[,"Global_active_power"], type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

