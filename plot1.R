##read Data

household <- read.csv("./household_power_consumption.txt", header=TRUE, sep=";", 
                      stringsAsFactors=FALSE, na.strings = "?", dec=".")

## Format Date and time
household$Date <- as.Date(household$Date, format = "%d/%m/%Y")


##Subset Data according to the date range provided
household_subset <-subset(household, household$Date >= "2007-02-01" & household$Date <= "2007-02-02")


##Creat a new column by combining date and time
household_subset$TS <- as.POSIXct(paste(household_subset$Date, household_subset$Time, seperator = " "))

## plot 1
hist(household1$Global_active_power,main= "Global Active Power", xlab= "Global Active Power (kilowatts)", ylab= "Frequency", col= "red")

## save a file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()

