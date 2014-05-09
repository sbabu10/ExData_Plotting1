# project1 - plot3 program file as part of projet assigment 1
# program to read power consumption file, 
#         filter data for the required dates and 
#         then plot x-y plot similar to the plot given in the assignment ( threee variables in y axis)

# check power consumption exists in the current folder
# also check plot1.png file does not exists in the current folder

infile<-"household_power_consumption.txt"
plotfn<-"plot3.png"

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
# plot x-y plot for first variable sub_metering_1
plot(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Sub_metering_1,
             type="l",xlab="",ylab="Energy sub metering")
# plot second and third variables sub_mereting_2 and sub_metering_3
lines(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Sub_metering_2,col="red")
lines(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy the plot to png file
#dev.copy(png,file=plotfn,width=480,height=480)   #dev.size("px")[1],height=dev.size("px")[2],units="px")
dev.off()
