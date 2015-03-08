#read in the data
data=read.table("household_power_consumption.txt", header=T, sep=';', dec='.', na.string="?")
#change Date format
data$Date=as.Date(data$Date, format="%d/%m/%Y")
#subsetting data
datasub<- data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')),]

#generate plot1
hist(datasub$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)", )
#print in png
dev.print(png, file="plot1.png", width=480, height=480)
