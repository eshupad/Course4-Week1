library("data.table")



#Reads and Subset
pwr <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Preventing histogram from printing in scientific notation
pwr[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Changing to Date Type
pwr[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filtering Dates
pwr <- pwr[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(pwr[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
