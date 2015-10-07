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


#plot1

png(file= "plot1.png")

par(mfrow= c(1,1))

hist(Project$Global_active_power,col = "red",xlab="Global Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power")

dev.off()
