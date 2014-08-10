# Read data from file
data <- read.csv2("./household_power_consumption.txt", colClasses="character")

# Convert date strings to Date classes 
data[,"Date"] <- as.Date(data[,"Date"], "%d/%m/%Y")

# Subset data
sample_daterange = as.Date(c("2007-02-01","2007-02-02"))
sample_data = subset(data, data[,"Date"] %in% sample_daterange)

# Convert data for data axis to numeric
sample_data[,"Global_active_power"] <- as.numeric(sample_data[,"Global_active_power"])

# Build plot
png("plot1.png", width=480, height=480)
hist(sample_data[,"Global_active_power"], col="Red", main="Global Active Power", 
     ylab="Frequency", xlab="Global Active Power (kilowatts)")
dev.off()

