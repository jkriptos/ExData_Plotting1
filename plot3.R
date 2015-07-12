source("core.R")

Plot3.Compose <- function(uri = "household_power_consumption.txt"){
    png(file = "plot3.png", bg = "white")
    
    par(mfrow = c(1, 1))
    EnergySubmetering.Plot(uri)
    
    dev.off()
}
