# Read the given data
house_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE, 
                       na.string="?",check.names=FALSE,stringsAsFactors =FALSE,
                       comment.char ="",quote='\"' )
#read the date as date
house_data$Date<-as.Date(house_data$Date,format="%d/%m/%Y")
#select data in the appropriate date window
house_data_full<-subset(house_data, 
                        subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(house_data)
##converting dates
date_and_time<-paste(as.Date(house_data_full$Date),house_data_full$Time)
house_data_full$Datetime<-as.POSIXct(date_and_time)
#plot number 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(house_data_full, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l",
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l",
             ylab="Global_reactive_power",xlab="datetime")
})
# Save the plot

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


