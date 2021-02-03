#Each time you open a new RStudio session, you need to run the following three commands.
#Highlight them and press Run or CTRL+ENTER
require(mosaic)
require(openintro)
require(MASS)

#Read in the Youngprof dataset
Youngprof<-read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/Youngprof.csv")

#View the dataset
View(Youngprof)

#We want to make a barchart for each of the nominal variables: 
#  gender, realestate, broadband, and children
#We'll do gender first

#run the command below:
barchart(Youngprof$gender)

#change to vertical bars
barchart(Youngprof$gender, horizontal=FALSE)

#add chart label
barchart(Youngprof$gender, horizontal=FALSE, 
         main="Gender of Respondents")

#change bar color
barchart(Youngprof$gender, horizontal=FALSE, 
         main="Gender of Respondents", col="skyblue4")

#change vertical axis label
barchart(Youngprof$gender, horizontal=FALSE, 
         main="Gender of Respondents", col="skyblue4", ylab="Count")

#Make a barchart for Broadband
barchart(Youngprof$broadband, horizontal=FALSE, 
         main="Broadband Access", col="skyblue4", ylab="Count")

#Make a contingency table for gender and broadband
contable<-xtabs(~gender+broadband, data=Youngprof)
#Read the output from your table
contable