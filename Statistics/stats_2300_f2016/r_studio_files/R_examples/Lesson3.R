#Calculate the expected value, variance, and standard deviation 
#of a discrete random variable

#Enter the x_i values for the random variable
values<-c(1,2,3,4,5,6,7)

#Enter the observed frequencies for each x_i
freq<-c(25,89,101,96,58,39,12)

#calculate the probability p(x_i)
prob<-freq/sum(freq)

#calculate the expected value for X
ev<-sum(values*prob)
ev

#calculate the deviations from expected value for each x_i
devs<-values-ev

#square each deviation
sqdevs<-(devs)^2

#multiply each deviation by the probability p(x_i) 
#and add them up to get the variance
var<-sum(sqdevs*prob)
var

#calculate the standard deviation
stdev<-sqrt(var)
stdev

#create a table of the intermediate results
evvar<-rbind(values,freq,prob,devs,sqdevs)
evvar<-t(evvar)
evvar