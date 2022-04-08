#Creating a probability distribution from calculated theoretical probabilities
#Example: 3-child families

#create a vector of values for the random variable x
values<-c(0,1,2,3)
#create a vector of probabilities
probs<-c(1/8,3/8,3/8,1/8)
#create a barplot of the probability distribution
barplot(probs, names.arg=values, ylim=c(0,.4),
        main="3 child families", ylab="Probability",
        xlab="Number of girls", col="#D4A7B1")


#Creating a probability distribution from observed frequencies
#Example: Restaurant Seating

#create a vector of values for the random variable x
values<-c(1,2,3,4,5,6,7)
#create a vector of observed frequencies
freq<-c(25,89,101,96,58,39,12)

#create a vector of probabilities by dividing the frequencies by the total
prob<-freq/sum(freq)

#Plot the frequencies. Change the label names and colors as desired
barplot(freq, names.arg=values, main="Restaurant Seating",
        ylab="Frequency", xlab="Party Size", col="#F3A176")

#Plot the probabilities. You may need to change the upper limit of the ylim
#command to adjust the y-axis. Change the labels and colors as desired.
barplot(prob, names.arg=values, ylim=c(0,.25),
        main="Restaurant Seating", ylab="Probability",
        xlab="Party Size", col="#D4A7B1")