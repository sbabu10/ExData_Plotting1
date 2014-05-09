# project1 - plot1 program file as part of projet assigment 1
# program to read power consumption file, 
#         filter data for the required dates and 
#         then plot histogram similar to the histogram given in the assignment

# check power consumption exists in the current folder
# also check plot1.png file does not exists in the current folder

infile<-"household_power_consumption.txt"
plotfn<-"plot1.png"

if (!file.exists(infile)) {
   stop(paste("file",infile,"does not exists in the current folder... aborting......"))
}

if (file.exists(plotfn)) {
  stop(paste("plot file",plotfn,"already exists in the current folder... aborting......"))
}

# read the file and create a data frame and filer data for the two required dates
powerconsall<-read.csv2("household_power_consumption.txt",dec=".",as.is=T,na.strings= c("?"))
powerconsreqd<-powerconsall[powerconsall$Date=="1/2/2007" | powerconsall$Date=="2/2/2007",]

# plot the histogram as required
hist(powerconsreqd$Global_active_power,xlab="Global Active Power (kilowatts)", ylab="Frequency",
                   main="Global Active Power",col="red",cex.axis=0.75,cex.lab=0.75,cex.main=0.75)
# copy the histogram to png file
dev.copy(png,file=plotfn,width=480,height=480)
dev.off()
