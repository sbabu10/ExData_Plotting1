# project1 - plot2 program file as part of projet assigment 1
# program to read power consumption file, 
#         filter data for the required dates and 
#         then plot x-y plot similar to the histogram given in the assignment

# check power consumption exists in the current folder
# also check plot1.png file does not exists in the current folder

infile<-"household_power_consumption.txt"
plotfn<-"plot2.png"

if (!file.exists(infile)) {
  stop(paste("file",infile,"does not exists in the current folder... aborting......"))
}

if (file.exists(plotfn)) {
  stop(paste("plot file",plotfn,"already exists in the current folder... aborting......"))
}

# read the file and create a data frame and filer data for the two required dates
powerconsall<-read.csv2("household_power_consumption.txt",dec=".",as.is=T,na.strings= c("?"))
powerconsreqd<-powerconsall[powerconsall$Date=="1/2/2007" | powerconsall$Date=="2/2/2007",]

# prepare x-y plot as required
plot(strptime(paste(powerconsreqd$Date,powerconsreqd$Time),"%d/%m/%Y %H:%M:%S"),powerconsreqd$Global_active_power,
              type="l",ylab="Global Active Power (kilowatts)",xlab="",cex.axis=0.75,cex.lab=0.75)

# save the plot into a png file
dev.copy(png,file=plotfn,width=480,height=480)
dev.off()
