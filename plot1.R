rm(list=ls())
ds <- read.table('household_power_consumption.txt', header=TRUE, sep=';', dec='.', stringsAsFactors=FALSE)
plotData <- ds[ds$Date %in% c('1/2/2007','2/2/2007'),]
globalAP <- as.numeric(plotData$Global_active_power)

png('plot1.png', height=480, width=480)
hist(globalAP, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')
dev.off()