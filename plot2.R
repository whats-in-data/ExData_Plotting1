testfunction <- function(){
        library(sqldf)
        data <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
        on.exit(closeAllConnections())
        data$DateTime <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y %H:%M:%S")
               
        plot(x=data$DateTime,y=data$Global_active_power,type="l", ylab="Global Active Power (killowatts)", xlab= "")
        dev.copy(png,'plot2.png')
        dev.off()
       
}
