
df$newdate<-as.Date(df$Date,"%d/%m/%Y")

df$newtime<-strptime(paste(df$newdate,df$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")

data<-subset(df,df$newdate==as.Date("2007-02-01") | df$newdate==as.Date("2007-02-02"))

png(filename="plot2.png")
plot(data$newtime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
