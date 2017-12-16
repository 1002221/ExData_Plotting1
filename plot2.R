a<-read.table('./household_power_consumption.txt',sep=";",header=TRUE)
a$Date<-dmy(a$Date)
b<-a[a$Date== ymd('2007-02-01') | a$Date==ymd('2007-02-02'),]
b$datetime<-as.POSIXct(paste(b$Date, b$Time), format="%Y-%m-%d %H:%M:%S")
plot(b$datetime,b$Global_active_power,type="l",
     ylab="Global active power (kilowatts)",
     xlab="")