testfunction <- function(){
        library(sqldf)
        data <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
        on.exit(closeAllConnections())
        data$DateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
        
        png("plot4.png")
        
        par(mfrow = c(2,2))       
        plot(x=data$DateTime,y=data$Global_active_power,type="l", ylab="Global Active Power", xlab= "")
        
        plot(x=data$DateTime,y=data$Voltage,type="l", ylab="Voltage", xlab= "datetime")
        
        plot(x=data$DateTime,y=data$Sub_metering_1,type="n", ylab="Energy sub metering", xlab= "")
        points(x=data$DateTime,y=data$Sub_metering_1,type="l")
        points(x=data$DateTime,y=data$Sub_metering_2,type="l", col="red")
        points(x=data$DateTime,y=data$Sub_metering_3,type="l", col="blue")
        legend("topright",lty=c(1,1,1),col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
        
        plot(x=data$DateTime,y=data$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab= "datetime")
        
        
        dev.off()
       
}
