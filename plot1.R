classes<-c("character","character","numeric","numeric", "numeric", "numeric","numeric", "numeric", "numeric")# using the colClasses to specify the classes of columns which make the reading fast
pwrData<-read.table("household_power_consumption.txt",header=T,colClasses =classes, na.strings=c("?"), sep=";") # reading the table with the arguments mentioned  in read.me

pwrData$DateTime <-as.POSIXct(strptime(paste(pwrData$Date, pwrData$Time), format = "%d/%m/%Y %H:%M:%S")) # Converting to Data Time Varibles to Classes


pwrData<-pwrData[(pwrData$Date=="1/2/2007")|(pwrData$Date=="2/2/2007"),] #Subsetting the pwrData for the specified Dates of pwrData


png("plot1.png", width = 480, height = 480)# Creating a png file (opening a file to plot)
hist(as.numeric(pwrData$Global_active_power), xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power") # writing to a file creating the histogram
dev.off() # closing the png