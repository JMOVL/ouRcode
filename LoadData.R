library(zoo)
library(xts)
library(highfrequency)
library(zoom)
#source('C:/Users/Vincent/ssi/SSIProject.R')
Sys.setenv(TZ="GMT")

starttime="2009-3-9 17:59"
endtime="2014-1-4"
samplingUnit="minutes"
SamplingFrequency=1

startfile="C:/Users/Vincent/ssi/Price_Data/"
endfile="_5min.csv"
ccypair=c("EURUSD","AUDUSD","GBPUSD","USDJPY","USDCAD","USDCHF","GBPJPY","EURJPY","NZDUSD")
ccypair=c("EURUSD")
if (exists('dataM')) rm(dataM)
datatype=c("Ask","Bid","SSIHistOrders","SSIHistOrdersNET")





for (ii in 1:(length(ccypair)))
{
  print(ccypair[ii])
  for (jj in 1:(length(datatype)))
  {
    print(datatype[jj])
    tmpname=paste(startfile,datatype[jj],'_',ccypair[ii],endfile,sep="")
    tmp2 = ReadData(tmpname,starttime,endtime,datatype[jj]) 
  tmp2=aggregatets(tmp2,on=samplingUnit,k=SamplingFrequency) #synchronisation by resampling all data on same sample time
   #tmp2=tmp2[seq(2,length(tmp2),2),] # resampling to get the points you want
   if (!exists('dataM'))  {dataM <- tmp2} else {dataM <- cbind(dataM,tmp2)} 
    colnames(dataM)[(ncol(dataM))]=paste(datatype[jj],ccypair[ii],sep="_")
  }
}


dataM2=na.locf(dataM,na.rm=TRUE) #replace na with previous value and when none remove
print('na removed ratio')
print(length(dataM2)/length(dataM))

dataM=subset(dataM2,!(is.weekend(time(dataM2)))) #remove week ends friday 5pm to sunday 5pm NY time (cheated as GMT)

