data1 <- read.table("household_power_consumption.txt",
                    sep = ";",stringsAsFactors = FALSE)
raw_data1 <- subset(data1, V1 == "1/2/2007")
raw_data2 <- subset(data1, V1 == "2/2/2007")
raw_data <- rbind(raw_data1,raw_data2)
# Read the data
rm(data1)
rm(raw_data1)
rm(raw_data2)
#remove in-process datasets

colnames(raw_data) <- c("Date","Time","Global_active_power",
                        "Global_reactive_power","Voltage","Global_intensity",
                        "Sub_metering_1","Sub_metering_2","Sub_metering_3")

date_data <- paste(raw_data$Date,raw_data$Time,sep = ",")
date_data <- strptime(date_data,"%d/%m/%Y,%H:%M:%S")

png("plot4.png",width=480,height=480)

par(mfrow = c(2,2))

plot(date_data,as.numeric(raw_data$Global_active_power),type = "o",pch = "",
     xlab = "",ylab = "Global Active Power(kilowatts)")

plot(date_data,as.numeric(raw_data$Voltage),type = "o",pch = "",
     xlab = "",ylab = "Voltage")

plot(date_data,as.numeric(raw_data$Sub_metering_1),type = "o",pch = "",
     xlab = "",ylab = "Energy sub metering")
points(date_data,as.numeric(raw_data$Sub_metering_2),
       pch = "",type = "o",col = "red")
points(date_data,as.numeric(raw_data$Sub_metering_3),
       pch = "",type = "o",col = "blue")
legend(x = "topright",lty = c(1,1,1),col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(date_data,as.numeric(raw_data$Global_reactive_power),type = "o",pch = "",
     xlab = "",ylab = "Global_reactive_power")

dev.off()
#Well, The language of R is Chinese on my computer, so the lab of x-axis are 
#Chinese words in default.
#Here is the translation:
#周四 == Thu  周五 == Fri  周六 == Sat
#Thank you very much for your reviewing!
