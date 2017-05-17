#Course project 1: plot1. Part of Exploratory Data Analysis course.

#Download and unzip data
if(!file.exists("./course project 1")){dir.create("./course project 1")}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="./course project 1/Dataset.zip")
unzip(zipfile="./course project 1/Dataset.zip",exdir="./course project 1")

#Read and subset data
data <- read.table("./course project 1/household_power_consumption.txt", 
                   header=TRUE, sep=";", stringsAsFactors = FALSE,
                   col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
                   skip=66636, nrows =2880)

#Set timezone
curr_locale <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

#plot and save file
png(filename="./course project 1/plot4.png")
par(mfrow = c(2,2))

        #plot1
        plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Global_active_power, 
             type = "l", xlab="", ylab="Global active power")

        #plot2
        plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Voltage, 
             type = "l", xlab="datetime", ylab="Voltage")

        #plot3
        plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, 
             type = "n", xlab="", ylab="Energy sub metering")
        points(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Sub_metering_1, type = "l")
        points(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Sub_metering_2, type = "l", col = "red")
        points(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Sub_metering_3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               lty = c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"), bty = "n")

        #plot4
        plot(as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"), data$Global_reactive_power, 
             type = "l", xlab="datetime", ylab="Global_reactive_power")       
        
dev.off()

#Reset timezone
Sys.setlocale("LC_TIME",curr_locale)