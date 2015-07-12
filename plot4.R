source("core.R")
source("plot2.R")
source("plot3.R")

Plot4.Compose <- function(uri = "household_power_consumption.txt"){
    png(file = "plot4.png", bg = "white")
    
    df <- GetPowerConsumptionData(uri)
    
    par(mfrow = c(2, 2))
    GlobalActivePower.Plot(uri, df, ylab = "Global Active Power")
    Voltage.Plot(uri, df)
    EnergySubmetering.Plot(uri, df)
    GlobalReactivePower.Plot(uri, df)
    
    dev.off()
}


