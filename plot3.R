##Sub_metering columns as numeric
hpc$Sub_metering_1 <- as.numeric(as.character(hpc$Sub_metering_1))
hpc$Sub_metering_2 <- as.numeric(as.character(hpc$Sub_metering_2))

##plot graph without x axis values/labels
with(hpc,plot(Sub_metering_1,ylab="Energy sub metering",type="l",xaxt='n',xlab=""))

##Create column with weekdays
hpc$WD <- as.character(weekdays(hpc$Date))

##First index matches for Thursday and Friday
WD <- hpc$WD
Thurs <- match("Thursday",WD)
Fri <- match("Friday",WD)
WDIndex <- c(Thurs,Fri,nrow(hpc))

##Add x axis values
axis(1, at = WDIndex, labels= c("Thu","Fri","Sat"),tick=TRUE)

##Add Sub-metering_2/3 lines to graph
with(hpc,lines(Sub_metering_2,col="red"))
with(hpc,lines(Sub_metering_3,col="blue"))

##Create legend and output graph
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lty=c(1,1,1),y.intersp = c(0.5,0.5,0.5),x.intersp = c(0.5,0.5,0.5),cex=c(0.8,0.8,0.8))
dev.copy(png, file = "plot3.png")
dev.off()

