library(dplyr)

#Loads the dataset for only the two days necessary for the analysis
GetPowerConsumptionData <- function(uri){
    ReadDataset <- function(uri){
        if(!file.exists(uri)){
            stop("File does not exists")
        }
        
        header <- read.table(uri, nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
        data <- read.csv(uri, sep = ";", skip = 66637, nrows = 2880, header = FALSE)
        colnames(data) <- unlist(header)
        
        data.frame(data)
    }
    
    TransformDateTimeCols <- function(df){
        df %>%
            transform(Date = as.Date(Date, "%d/%m/%Y"))
    }
    
    df <- ReadDataset(uri)
    df <- TransformDateTimeCols(df)
    
    df
}

#Prints the Global Active Power histogram.
GlobalActivePower.Hist <- function(uri = "household_power_consumption.txt", df = NULL){
    if(is.null(df)){
        df <- GetPowerConsumptionData(uri)
    }
    
    hist(df$Global_active_power, 
         xlab = "Global Active Power (kilowatts)", 
         col = "red",
         main = "Global Active Power")
}

#Prints the Global Active Power Plot. 
GlobalActivePower.Plot <- function(uri = "household_power_consumption.txt", df = NULL, ...){
    if(is.null(df)){
        df <- GetPowerConsumptionData(uri)
    }
       
    plot(df$Global_active_power, typ = 'l', 
         xlab = "", xaxt = 'n', ...)
    
    axis(1, at = c(0, 1441, 2881), labels = c('Thu', 'Fri', 'Sat'))
}

#Prints the Energy Submetering plot.
EnergySubmetering.Plot <- function(uri = "household_power_consumption.txt", df = NULL){
    if(is.null(df)){
        df <- GetPowerConsumptionData(uri)
    }
    
    plot(df$Sub_metering_1, type = "n",
         ylab="Energy sub metering", xlab="", xaxt='n')
    
    
    points(df$Sub_metering_1, col = "black", type = "l")
    points(df$Sub_metering_2, col = "red", type = "l")
    points(df$Sub_metering_3, col = "blue", type = "l")
    
    axis(1, at = c(0,1441,2881), labels = c('Thu','Fri','Sat'))
    
    legend("topright", 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=c(1, 1, 1),
           lwd=c(1, 1, 1),
           col=c("black", "red", "blue"))
}

#Prints the Voltage Plot
Voltage.Plot <- function(uri = "household_power_consumption.txt", df = NULL){
    if(is.null(df)){
        df <- GetPowerConsumptionData(uri)
    }
    
    plot(df$Voltage, typ = 'l', 
         ylab = "Voltage", xlab = "datetime", xaxt = 'n')
    
    axis(1, at = c(0,1441,2881), labels = c('Thu','Fri','Sat'))
}

#Prints the Global Reactive Power plot.
GlobalReactivePower.Plot <- function(uri = "household_power_consumption.txt", df = NULL, ...){
    if(is.null(df)){
        df <- GetPowerConsumptionData(uri)
    }
    
    plot(df$Global_reactive_power, typ = 'l', 
         ylab = "Global_reactive_power", xlab = "datetime", xaxt = 'n')
    
    axis(1, at = c(0,1441,2881), labels = c('Thu','Fri','Sat'))
}