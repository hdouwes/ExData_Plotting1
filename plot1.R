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

#plot and save file
png(filename="./course project 1/plot1.png")
hist(data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()