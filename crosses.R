#dataM=dataMsave

ccypair=c("EURJPY","GBPJPY")


for (ii in 1:(length(ccypair))){
  
#   ccy1ask=paste('Ask_',substring(ccypair[ii],1,3),'USD',sep="")
#   ccy2bid=paste('Bid_',substring(ccypair[ii],4,6),'USD',sep="")
#   dataM <- cbind(dataM,dataM[,ccy1ask]/dataM[,ccy2bid])
#   colnames(dataM)[(ncol(dataM))]=paste('Ask_',ccypair[ii],sep="")
#   
#   ccy1bid=paste('Bid_',substring(ccypair[ii],1,3),'USD',sep="")
#   ccy2ask=paste('Ask_',substring(ccypair[ii],4,6),'USD',sep="")
#   dataM <- cbind(dataM,dataM[,ccy1bid]/dataM[,ccy2ask])
#   colnames(dataM)[(ncol(dataM))]=paste('Bid_',ccypair[ii],sep="")
  
  ccy1ssi=paste('SSIHistOrders_',substring(ccypair[ii],1,3),'USD',sep="")
  ccy2ssi=paste('SSIHistOrders_USD',substring(ccypair[ii],4,6),sep="")
  tmp=dataM[,ccy1ssi]
  tmp[(tmp<0)]=-1/tmp[(tmp<0)]
  tmp2=dataM[,ccy2ssi]
  tmp2[(tmp2<0)]=-1/tmp2[(tmp2<0)]
  tmp3=tmp*tmp2
  tmp3[(tmp3<1)]=-1/tmp3[(tmp3<1)]
  dataM <- cbind(dataM,tmp3)
  colnames(dataM)[(ncol(dataM))]=paste('SSIHistOrdersSynth_',ccypair[ii],sep="")
  
  
  ccy1ssi=paste('SSIHistOrdersNET_',substring(ccypair[ii],1,3),'USD',sep="")
  ccy2ssi=paste('SSIHistOrdersNET_USD',substring(ccypair[ii],4,6),sep="")
  tmp=dataM[,ccy1ssi]
  tmp[(tmp<0)]=-1/tmp[(tmp<0)]
  tmp2=dataM[,ccy2ssi]
  tmp2[(tmp2<0)]=-1/tmp2[(tmp2<0)]
  tmp3=tmp*tmp2
  tmp3[(tmp3<1)]=-1/tmp3[(tmp3<1)]
  dataM <- cbind(dataM,tmp3)
  colnames(dataM)[(ncol(dataM))]=paste('SSIHistOrdersNETSynth_',ccypair[ii],sep="")
  
  
}

