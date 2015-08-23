#Read rds data for Emissions Data
NEI <- readRDS("summarySCC_PM25.rds")
#Read rds data for Source Classification Code
SCC <- readRDS("Source_Classification_Code.rds")
# Sum of all emissions by individual years
aggData<-with (NEI,aggregate(NEI[,'Emissions'],by=list(year), sum, na.rm=TRUE))
# Change the col names to Year and TotalEmission
names(aggData) <- c('Year', 'TotalEmission')
#Open the graphic device to plot data
png(filename='plot1.png', width=480, height=480, units='px')
#Plot the aggregated data 
plot(aggData, type="l", xlab="Year", ylab="Total PM2.5 Emmision From All Sources Between 1999-2008", 
     col="dark red", xaxt="n", main="Total Emissions (tons)")
#Plot the x-axis
axis(1, at=as.integer(aggData$Year), las=1)
#Close graphic device
dev.off()
