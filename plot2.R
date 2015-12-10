rm(list=ls())

# Read data & subset from date 1/2/2007 to 2/2/2007
ds <- read.table('household_power_consumption.txt', header=TRUE, sep=';', dec='.', stringsAsFactors=FALSE)
ds$Date <- as.Date(ds$Date, format='%d/%m/%Y')
plotData <- ds[(ds$Date >= '2007-02-01' & ds$Date <= '2007-02-02'),]
globalAP <- as.numeric(plotData$Global_active_power)

# Plot data (Global Active Power ~ Date)
datetime <- as.POSIXct(paste(plotData$Date, plotData$Time))
png('plot2.png', height=480, width=480)
plot(globalAP~datetime, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.off()
