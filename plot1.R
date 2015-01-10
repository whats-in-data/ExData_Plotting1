testfunction <- function(){
        library(sqldf)
        testdata <- read.csv.sql('household_power_consumption.txt',"select * from file where Date in ('1/2/2007','2/2/2007')", sep = ';', header = T)
        on.exit(closeAllConnections())
        hist(testdata$Global_active_power, col = "red", main = "Global Active Power ", xlab ="Global Active Power (kilowatts)")
        dev.copy(png,'plot1.png')
        dev.off()
       
}
