allData <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)
allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
allDataNumeric <- cbind(allData[,1:2], data.matrix(allData[,3:9]))
selectedNumeric <- allDataNumeric[which(as.Date("2007-2-1") ==  allDataNumeric$Date | as.Date("2007-2-2") ==  allDataNumeric$Date),]

png('plot2.png')
par(pty='s')
plot(selectedNumeric$Global_active_power, type='l', xaxt='n',xlab='', ylab="Global Active Power (kilowatts)")
middle <- match("Friday",weekdays(selectedNumeric$Date))
end <-length(selectedNumeric[,1])
axis(1, at=c(1,middle,end), labels=c("Thur", "Fri", "Sat"))
dev.off()