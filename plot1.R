
df<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

df$newdate<-as.Date(df$Date,"%d/%m/%Y")

df$newtime<-strptime(paste(df$newdate,df$Time,sep=" "),format="%Y-%m-%d %H:%M:%S")

data<-subset(df,df$newdate==as.Date("2007-02-01") | df$newdate==as.Date("2007-02-02"))

png(filename="plot1.png")
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")
dev.off()

