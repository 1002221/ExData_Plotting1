a<-read.table('./household_power_consumption.txt',sep=";",header=TRUE)
a$Date<-dmy(a$Date)
b<-a[a$Date== ymd('2007-02-01') | a$Date==ymd('2007-02-02'),]
b$datetime<-as.POSIXct(paste(b$Date, b$Time), format="%Y-%m-%d %H:%M:%S")
with(b,plot(datetime,Global_reactive_power,type="l"))

par(mfrow=c(2,2))
plot(b$datetime,b$Global_active_power,type="l",
     ylab="Global active power",
     xlab="")
with(b,plot(datetime,Voltage,type="l"))
SM1<-as.numeric(as.character(b$Sub_metering_1))
SM2<-as.numeric(as.character(b$Sub_metering_2))
SM3<-as.numeric(as.character(b$Sub_metering_3))
plot(b$datetime,SM1,type="l",col="black",xlab="",ylab="Energy sub metering")
lines(b$datetime,SM2,col="red")
lines(b$datetime,SM3,col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col = c("black","red","blue"),lty=1,bty = "n",cex=.75)
with(b,plot(datetime,Global_reactive_power,type="l"))
