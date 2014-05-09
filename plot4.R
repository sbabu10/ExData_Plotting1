# project1 - plot4 program file as part of projet assigment 1
# program to read power consumption file, 
#         filter data for the required dates and 
#         then plot a plot similar to the plot given in the assignment ( 4 plots in a single graph )

# check power consumption exists in the current folder
# also check plot1.png file does not exists in the current folder

infile<-"household_power_consumption.txt"
plotfn<-"plot4.png"

if (!file.exists(infile)) {
  stop(paste("file",infile,"does not exists in the current folder... aborting......"))
}

if (file.exists(plotfn)) {
  stop(paste("plot file",plotfn,"already exists in the current folder... aborting......"))
}

# read the file and create a data frame and filer data for the two required dates
powerconsall<-read.csv2("household_power_consumption.txt",dec=".",as.is=T,na.strings= c("?"))
powerconsreqd<-powerconsall[powerconsall$Date=="1/2/2007" | powerconsall$Date=="2/2/2007",]


# open png device
png(filename=plotfn,width=480,height=480)

# set number of graphs to be shown on the device
par(mfcol=c(2,2))

# plot the first plot (top left)
plot(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Global_active_power,type="l",
             ylab="Global Active Power",xlab="",font.lab=2)

# plot the second plot ( bottom left )
# plot x-y plot for first variable sub_metering_1
plot(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Sub_metering_1,
             type="l",xlab="",ylab="Energy sub metering",font.lab=2)
# plot second and third variables sub_mereting_2 and sub_metering_3
lines(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),
               powerconsreqd$Sub_metering_2,col="red")
lines(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),
               powerconsreqd$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n",cex=0.95)

# plot the third plot ( top right )
plot(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Voltage,
           type="l",ylab="Voltage",xlab="datetime",font.lab=2)

# plot the fourth plot ( bottom right )
plot(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Global_reactive_power,
           type="l",ylab="Global_reactive_power",xlab="datetime",font.lab=2)

# copy the plot to png file
#dev.copy(png,file=plotfn,width=480,height=480,units="px")
dev.off()
