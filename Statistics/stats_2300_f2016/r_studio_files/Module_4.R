#Require packages
require(mosaic)
require(MASS)
require(openintro)

#Read in the Landfill data set
Landfill<-read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/Landfill.csv")

#Construct a frequency histogram of the truck weights
hist(Landfill$Weights, main="Truck Weights", 
     xlab="Weight in pounds", xaxt='n')
axis(side=1, at=seq(30000,55000,2000))

#Add a vertical line at the mean of the data set
abline(v=mean(Landfill$Weights), col="red", lwd=4)

#Calculate the mean of the truck weights
mean(Landfill$Weights)

#Now take a simple random sample of 5 of these trucks and
#store the results in a vector called x.
x<-sample(Landfill$Weights, 5)
#look at the numbers in this sample and calculate the mean
x #data for this sample
mean(x) #this sample mean

#Re-run lines 22 through 25 three times and record your sample 
#mean each time on the worksheet. Mark each sample mean on 
#your histogram.


#Now take a simple random sample of 20 of these trucks and
#store the results in a vector called x.
x<-sample(Landfill$Weights, 20)
#look at the numbers in this sample and calculate the mean
x #data for this sample
mean(x) #this sample mean

#Re-run lines 34 through 37 three times and record your sample 
#mean each time on the worksheet. Mark each sample mean on 
#your histogram.

#Now take a simple random sample of 50 of these trucks and
#store the results in a vector called x.
x<-sample(Landfill$Weights, 50)
#look at the numbers in this sample and calculate the mean
x #data for this sample
mean(x) #this sample mean

#Re-run lines 45 through 48 three times and record your sample 
#mean each time on the worksheet. Mark each sample mean on 
#your histogram.