df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dfSub <- df[(df$Date=="1/2/2007") | (df$Date=="2/2/2007"),]
dfSub$Date <- as.Date(dfSub$Date, format="%d/%m/%Y")
dfSub$Time <- strptime(dfSub$Time, format="%H:%M:%S")
dfSub[1:1440,"Time"] <- format(dfSub[1:1440,"Time"],"2007-02-01 %H:%M:%S")
dfSub[1441:2880,"Time"] <- format(dfSub[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(dfSub$Time,dfSub$Sub_metering_1,type="l",col="black", xlab="", ylab = "Energy Sub Metering")
lines(dfSub$Time,dfSub$Sub_metering_2,col="red")
lines(dfSub$Time,dfSub$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()