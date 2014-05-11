library(ggplot2)

# file downloading and unzipping
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip", method = "wget")
unzip("power.zip")

# read table and doing subset
table <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")
table[, 1] <- as.Date(table[, 1], "%d/%m/%Y") # not that important, but makes things more clear
table <- table[which(table[, 1] == "2007-02-01" | table[, 1] == "2007-02-02"), ]

table$datetime <- paste(table[,1], table[,2], sep = "")
table$datetime <- as.POSIXlt(strptime(table$datetime, "%Y-%m-%d %H:%M:%S"))

png("plot2.png")
plot(table$datetime, table[,3], type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

