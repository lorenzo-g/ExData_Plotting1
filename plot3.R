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

png("plot3.png")
plot(table$datetime, table[,7], type="l", ylab = "Energy sub metering", xlab = "")
lines(table$datetime, table[,8], type="l", ylab = "Energy sub metering", xlab = "", col = "red")
lines(table$datetime, table[,9], type="l", ylab = "Energy sub metering", xlab = "", col = "blue")
legend("topright", col=c("black", "red", "blue"), cex = 0.95, lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

