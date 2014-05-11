classes<-c("character","character","numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric")# using the colClasses to specify the classes of columns which make the reading fast
pwrpwrData<-read.table("household_power_consumption.txt",header=T,colClasses =classes, na.strings=c("?"), sep=";") # reading the table with the arguments mentioned  in read.me

pwrpwrData$DateTime <-as.POSIXct(strptime(paste(pwrpwrData$Date, pwrpwrData$Time), format = "%d/%m/%Y %H:%M:%S")) # Converting to pwrData Time Varibles to Classes


pwrpwrData<-pwrpwrData[(pwrpwrData$Date=="1/2/2007")|(pwrpwrData$Date=="2/2/2007"),] #Subsetting the pwrpwrData for the specified Dates of pwrpwrData


png("plot4.png", width = 480, height = 480)# Creating a png file (opening a file to plot)

par(mfrow=c(2,2)) ## multiple plots

plot(pwrpwrData$DateTime,pwrData$Global_active_power,pch=NA,xlab="",ylab="Global Active Power (kilowatts)")
lines(pwrData$DateTime, pwrData$Global_active_power)


plot(pwrData$DateTime, pwrData$Voltage, ylab="Voltage", xlab="datetime", pch=NA) # Voltage 
lines(pwrData$DateTime, pwrData$Voltage)

# Submetering plot
plot(pwrData$DateTime,
     pwrData$Sub_metering_1,
     pch=NA,
     xlab="",
     ylab="Energy sub metering")
lines(pwrData$DateTime, pwrData$Sub_metering_1)
lines(pwrData$DateTime, pwrData$Sub_metering_2, col='red')
lines(pwrData$DateTime, pwrData$Sub_metering_3, col='blue')
legend('topright',c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1,1),col = c('black', 'red', 'blue'),bty = 'n')

with(pwrData, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(pwrData, lines(DateTime, Global_reactive_power))

dev.off()