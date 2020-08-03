hpc$WD <- as.character(weekdays(hpc$Date))
WD <- hpc$WD
Thurs <- match("Thursday",WD)
Fri <- match("Friday",WD)
WDIndex <- c(Thurs,Fri,nrow(hpc))

hpc$Voltage <- as.numeric(as.character(hpc$Voltage))
hpc$Global_reactive_power <- as.numeric(as.character(hpc$Global_reactive_power))

par(mfrow = c(2,2),mar=c(2,2,2,2),oma = c(1,1,1,1))

with(hpc, {
  source("plot2.R")
  plot(Voltage,ylab="Voltage",type="l",xaxt='n',xlab="datetime")
  axis(1, at = WDIndex, labels= c("Thu","Fri","Sat"),tick=TRUE)
  source("plot3.R")
  plot(Global_reactive_power,ylab="Global_reactive_power",type="l",xaxt='n',xlab="datetime")
  axis(1, at = WDIndex, labels= c("Thu","Fri","Sat"),tick=TRUE)
})
     
dev.copy(png, file = "plot4.png")
dev.off()    
