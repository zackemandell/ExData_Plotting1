Electric_Power_Consump <- read.table(path, header=TRUE, stringsAsFactors=FALSE, sep=";")

###   Formatting Data   ### 
Electric_Power_Consump$Date <- as.Date(Electric_Power_Consump$Date)
Electric_Power_Consump$Global_active_power <- as.numeric(Electric_Power_Consump$Global_active_power)
Electric_Power_Consump$Voltage <- as.numeric(Electric_Power_Consump$Voltage)
Electric_Power_Consump$Global_intensity <- as.numeric(Electric_Power_Consump$Global_intensity)
Electric_Power_Consump$Sub_metering_1 <- as.numeric(Electric_Power_Consump$Sub_metering_1)
Electric_Power_Consump$Sub_metering_2 <- as.numeric(Electric_Power_Consump$Sub_metering_2)
Electric_Power_Consump$Sub_metering_3 <- as.numeric(Electric_Power_Consump$Sub_metering_3)

### Data Subset ### 
Power_subSet2<- Electric_Power_Consump[Electric_Power_Consump$Date %in% c("1/2/2007","2/2/2007") ,]

### Plot 4 ###
datetime <- strptime(paste(Power_subSet2$Date, Power_subSet2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime,Power_subSet2$Global_active_power, type ="l",xlab="",ylab="Global Active Power",cex=0.2)
plot(datetime,Power_subSet2$Voltage, type ="l", xlab="datetime",ylab="Voltage")
plot(datetime,Power_subSet2$Sub_metering_1, type="l",ylab="Energy Submetering",xlab="")
lines(datetime,Power_subSet2$Sub_metering_2, type="l", col="red")
lines(datetime,Power_subSet2$Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="o")
plot(datetime,Power_subSet2$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()