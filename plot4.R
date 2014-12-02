allData <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)
allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
allDataNumeric <- cbind(allData[,1:2], data.matrix(allData[,3:9]))
selectedNumeric <- allDataNumeric[which(as.Date("2007-2-1") ==  allDataNumeric$Date | as.Date("2007-2-2") ==  allDataNumeric$Date),]

png('Plot4.png')

par(mfrow=c(2,2))
plot(selectedNumeric$Global_active_power, type='l', xaxt='n',xlab='', ylab="Global Active Power")
middle <- match("Friday",weekdays(selectedNumeric$Date))
end <-length(selectedNumeric[,1])
axis(1, at=c(1,middle,end), labels=c("Thur", "Fri", "Sat"))

plot(selectedNumeric$Voltage, type='l', xaxt='n',xlab='', ylab="Voltage")
middle <- match("Friday",weekdays(selectedNumeric$Date))
end <-length(selectedNumeric[,1])
axis(1, at=c(1,middle,end), labels=c("Thur", "Fri", "Sat"))
mtext('datetime', side=1, line=3)


plot(selectedNumeric$Sub_metering_1, type='l', xaxt='n',xlab='', ylab="Energy sub metering")
middle <- match("Friday",weekdays(selectedNumeric$Date))
end <-length(selectedNumeric[,1])
axis(1, at=c(1,middle,end), labels=c("Thur", "Fri", "Sat"))
lines(selectedNumeric$Sub_metering_2, col="red",type='l', xaxt='n',xlab='', ylab="Energy sub metering")
lines(selectedNumeric$Sub_metering_3, col="blue",type='l', xaxt='n',xlab='', ylab="Energy sub metering")
legend(800,40,c('Sub_metering_1','Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'),lty=c(1,1,1),bty='n')

plot(selectedNumeric$Global_reactive_power, type='l', xaxt='n',xlab='', ylab="Global_reactive_power")
middle <- match("Friday",weekdays(selectedNumeric$Date))
end <-length(selectedNumeric[,1])
axis(1, at=c(1,middle,end), labels=c("Thur", "Fri", "Sat"))
mtext('datetime', side=1, line=3)
dev.off()