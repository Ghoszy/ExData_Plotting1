#data clearn

library("dplyr")

house_power<-tbl_df(read.table("household_power_consumption.txt",header=TRUE,sep=";", na.strings = c("?","")))

house_power$Date<-as.Date(house_power$Date,format="%d/%m/%Y")

Project<-subset(house_power,Date=="2007-2-1" | Date=="2007-2-2")

Project$datetime<-paste(Project$Date,Project$Time)

Project$Time<-strptime(Project$datetime, format = "%Y-%m-%d %H:%M:%S")

Project$Voltage<-as.character(Project$Voltage)

Project$Global_active_power<-as.character(Project$Global_active_power)

Project$Global_reactive_power<-as.character(Project$Global_reactive_power)

Project$Global_active_power<-as.numeric(Project$Global_active_power)

Project$Global_reactive_power<-as.numeric(Project$Global_reactive_power)

#plot3

png(file= "plot3.png")

plot(Project$Time,Project$Sub_metering_1,type = "l",xlab = "",ylab = "Energy sub metering",col="black")

par(new= TRUE)

lines(Project$Time,Project$Sub_metering_2,col="red")

par(new= TRUE)

lines(Project$Time,Project$Sub_metering_3,col="Blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lwd = c(1,1,1))

dev.off()
