# Exploratory Data Analysis plot3.R

raed_power <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')



raed_power$Date <- as.Date(raed_power$Date, format="%d/%m/%Y")
datetime <- paste(raed_power$Date, raed_power$Time)
raed_power$Time <- as.POSIXct(datetime)
Data <- subset(raed_power,Date >= "2007-02-01" & Date <= "2007-02-02")


plot(Data$Time, Data$Sub_metering_1,type="l",col="black",ylab ="Energy sub metering",xlab="")
lines(Data$Time, Data$Sub_metering_2,col="red")
lines(Data$Time, Data$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
