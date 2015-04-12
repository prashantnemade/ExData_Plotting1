
df$newdate<-as.Date(df$Date,"%d/%m/%Y")

df$newtime<-strptime(paste(df$newdate,df$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")

data<-subset(df,df$newdate==as.Date("2007-02-01") | df$newdate==as.Date("2007-02-02"))

png(filename="plot4.png")
par(mfrow=c(2,2),mar=c(4,4,1,1))

plot(data$newtime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(data$newtime,data$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(data$newtime,data$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
points(data$newtime,data$Sub_metering_1,type="l")
points(data$newtime,data$Sub_metering_2,type="l",col="red")
points(data$newtime,data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

plot(data$newtime,data$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
