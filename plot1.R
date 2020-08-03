##Read in date file
hpc <- read.csv("A:/Car Bike Team Insight/Team/James/Coursera/Data_Science_Specialisation_R/Course4_Exploratory_Data_Analysis/household_power_consumption.txt", header = TRUE, sep =";")

##Format dates and subset data
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",1:9]
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power))

##Create plot 1
hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()