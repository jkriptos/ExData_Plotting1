source("core.R")

Plot2.Compose <- function(uri = "household_power_consumption.txt"){
    png(file = "plot2.png", bg = "white")
    
    par(mfrow = c(1, 1))
    GlobalActivePower.Plot(uri, ylab = "Global Active Power (kilowatts)")
    
    dev.off()
}