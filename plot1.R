library(ggplot2)

# file downloading and unzipping
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip", method = "wget")
unzip("power.zip")

# read table and doing subset
table <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")
table[, 1] <- as.Date(table[, 1], "%d/%m/%Y") # not that important, buk makes things more clear
table <- table[which(table[, 1] == "2007-02-01" | table[, 1] == "2007-02-02"), ]

png("plot1.png")
hist(table[, 3], col = "red", ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
