#read in the data
data=read.table("household_power_consumption.txt", header=T, sep=';', dec='.')
#change Date format
data$Date=as.Date(data$Date, format="%d/%m/%Y")
#subsetting data
datasub<- data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
#merge date and time together
DateTime=as.POSIXct(paste(datasub$Date, datasub$Time), format="%Y-%m-%d %H:%M:%S")

#generate plot2
plot(x=DateTime, y=datasub$Global_active_power,type="l",lwd=1, xlab="",ylab="Global Active Power (kilowatts)")
dev.print(png, file="plot2.png", width=480, height=480)
