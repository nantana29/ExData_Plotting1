##read Data

household <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

## Format Date and time
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")


##Subset Data according to the date range provided
household_subset <-subset(household, household$Date >= "2007-02-01" & household$Date <= "2007-02-02")


##Creat a new column by combining date and time
household_subset$TS <- as.POSIXct(paste(household_subset$Date, household_subset$Time, seperator = " "))


## plot 3
png("plot3.png", height = 480, width = 480)
plot(household_subset$Sub_metering_1~household_subset$TS, type = "l", ylab = "Energy sub metering", xlab = "")

lines(household_subset$TS, household_subset$Sub_metering_2, col = "red")
lines(household_subset$TS, household_subset$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))
dev.off()
