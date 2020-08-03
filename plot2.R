##Create column with weekdays
hpc$WD <- as.character(weekdays(hpc$Date))

##Create Global Active Power Graph against x axis with empty values
with(hpc,plot(Global_active_power,ylab="Global Active Power (kilowatts)",type="l", xaxt='n',xlab=""))

##First index matches for Thursday and Friday
WD <- hpc$WD
Thurs <- match("Thursday",WD)
Fri <- match("Friday",WD)
WDIndex <- c(Thurs,Fri,nrow(hpc))

##Add x axis values and create plot 2
axis(1, at = WDIndex, labels= c("Thu","Fri","Sat"),tick=TRUE)
dev.copy(png, file = "plot2.png")
dev.off()

