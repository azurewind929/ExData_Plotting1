#read in the data
data=read.table("household_power_consumption.txt", header=T, sep=';', dec='.', na.string="?")
#change Date format
data$Date=as.Date(data$Date, format="%d/%m/%Y")
#subsetting data
datasub<- data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
#merge date and time together
DateTime=as.POSIXct(paste(datasub$Date, datasub$Time), format="%Y-%m-%d %H:%M:%S")
#merge submetering data together. 
Submetering<- cbind(datasub$Sub_metering_1, datasub$Sub_metering_2, datasub$Sub_metering_3)
DateTime3=rep(DateTime,3) #matching length of datetime and submetering

#making plots
par(mfrow=c(2,2),mar=c(4,4,1,1))
#plot1
plot(x=DateTime, y=datasub$Global_active_power, xlab='datetime',ylab='Global Active Power',type='l',col='black',cex.axis=1)
#plot2
plot(x=DateTime, y=datasub$Voltage,xlab='datetime',ylab='Voltage', type='l',col='black', cex.axis=1)
#plot3
plot(x=DateTime3, y=Submetering, xlab="datetime",ylab="Energy sub metering", cex.axis=1,type='n')
lines(x=DateTime, y=Submetering[,1],col='black')
lines(x=DateTime, y=Submetering[,2],col='red')
lines(x=DateTime, y=Submetering[,3],col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black",'red','blue'),lty="solid",cex=0.75,bty='n')
#plot4
plot(x=DateTime, y=datasub$Global_reactive_power,xlab='datetime',ylab='Global Reactive Power',type='l',col='black',cex.axis=1)

dev.print(png, file="plot4.png", width=480, height=480)