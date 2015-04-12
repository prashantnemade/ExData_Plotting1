
df$newdate<-as.Date(df$Date,"%d/%m/%Y")

df$newtime<-strptime(paste(df$newdate,df$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")

data<-subset(df,df$newdate==as.Date("2007-02-01") | df$newdate==as.Date("2007-02-02"))

png(filename="plot3.png")
plot(data$newtime,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(data$newtime,data$Sub_metering_1,type="l")
points(data$newtime,data$Sub_metering_2,type="l",col="red")
points(data$newtime,data$Sub_metering_3,type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
