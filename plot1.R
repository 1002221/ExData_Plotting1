a<-read.table('./household_power_consumption.txt',sep=";",header=TRUE)
a$Date<-dmy(a$Date)
#a$Time<-strptime(a$Time,format="%H:%M:%S")
b<-a[a$Date== ymd('2007-02-01') | a$Date==ymd('2007-02-02'),]
b$datetime<-as.POSIXct(paste(b$Date, b$Time), format="%Y-%m-%d %H:%M:%S")
Global_active_power<-as.numeric(as.character(b$Global_active_power))
hist(Global_active_power,col="red",
     main="Global active power",xlab="Global active power (kilowatts)")