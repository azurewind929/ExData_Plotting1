#read in the data
data=read.table("household_power_consumption.txt", header=T, sep=';', dec='.')
#change Date format
data$Date=as.Date(data$Date, format="%d/%m/%Y")
#subsetting data
datasub<- data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
#merge date and time together
DateTime=as.POSIXct(paste(datasub$Date, datasub$Time), format="%Y-%m-%d %H:%M:%S")

#merge submetering data together. 
Submetering<- cbind(datasub$Sub_metering_1, datasub$Sub_metering_2, datasub$Sub_metering_3)
DateTime3=rep(DateTime,3) #matching length of datetime and submetering
#plot
plot(x=DateTime3, y=Submetering, xlab="",ylab="Energy sub metering", type='n')
lines(x=DateTime, y=Submetering[,1],col='black')
lines(x=DateTime, y=Submetering[,2],col='red')
lines(x=DateTime, y=Submetering[,3],col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black",'red','blue'),lty="solid")
#print to png
dev.print(png, file="plot3.png", width=480, height=480)