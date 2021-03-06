rm(list=ls())

# Read data & subset from date 1/2/2007 to 2/2/2007
ds <- read.table('household_power_consumption.txt', header=TRUE, sep=';', dec='.', stringsAsFactors=FALSE)
ds$Date <- as.Date(ds$Date, format='%d/%m/%Y')
plotData <- ds[(ds$Date >= '2007-02-01' & ds$Date <= '2007-02-02'),]
datetime <- as.POSIXct(paste(plotData$Date, plotData$Time))

# Plot data
png('plot4.png', height=480, width=480)
par(mfrow=c(2,2))
plot(plotData$Global_active_power~datetime, type='l', xlab='', ylab='Global Active Power')
plot(plotData$Voltage~datetime, type='l', xlab='datetime', ylab='Voltage')
plot(plotData$Sub_metering_1~datetime, type='l', ylab='Energy sub metering', xlab='')
lines(plotData$Sub_metering_2~datetime, type='l', col='red')
lines(plotData$Sub_metering_3~datetime, type='l', col='blue')
legend('topright', col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, lwd=2)
plot(plotData$Global_reactive_power~datetime, type='l', xlab='datetime', ylab='Global_reactive_power')
dev.off()