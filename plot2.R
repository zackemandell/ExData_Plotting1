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

### Plot 2 ###
datetime <- strptime(paste(Power_subSet2$Date, Power_subSet2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime,Power_subSet2$Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)")
plot(datetime,Power_subSet2$Global_active_power)
dev.off()