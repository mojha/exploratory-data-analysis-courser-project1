# Read the given data
house_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,
                       na.string="?",check.names=FALSE,stringsAsFactors =FALSE,
                       comment.char ="",quote='\"' )
#read the date as Date
house_data$Date<-as.Date(house_data$Date,format="%d/%m/%Y")
#select data in the appropriate date window
house_data_full<-subset(house_data, subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(house_data)
##convert dates
date_and_time<-paste(as.Date(house_data_full$Date),house_data_full$Time)
house_data_full$Datetime<-as.POSIXct(date_and_time)
#Plot number 1

hist(house_data_full$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power(Kolowatts)",ylab="frequency",col="Red")
#Save the plot tp png file
dev.copy(png, file="plot1.png", height=480, width=480)
#Turn the png device off
dev.off()


