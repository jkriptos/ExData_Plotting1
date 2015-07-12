source("core.R")

Plot1.Compose <- function(uri = "household_power_consumption.txt"){
    png(file = "plot1.png", bg = "white")
    
    par(mfrow = c(1, 1))
    GlobalActivePower.Hist(uri)
    
    dev.off()
}