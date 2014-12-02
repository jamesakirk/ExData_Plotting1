allData <- read.table("household_power_consumption.txt", sep=";", stringsAsFactors = FALSE, header=TRUE)
allData$Date <- as.Date(allData$Date, format = "%d/%m/%Y")
allDataNumeric <- cbind(allData[,1:2], data.matrix(allData[,3:9]))
selectedNumeric <- allDataNumeric[which(as.Date("2007-2-1") ==  allDataNumeric$Date | as.Date("2007-2-2") ==  allDataNumeric$Date),]

png('plot1.png')
par(pty='s')
z <- hist(selectedNumeric$Global_active_power,col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()