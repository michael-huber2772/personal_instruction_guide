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

barchart(Youngprof$realestate, horizontal=FALSE, 
         main="Realestate", col="skyblue4", ylab="Count")


barchart(Youngprof$children, horizontal=FALSE, 
         main="Children", col="skyblue4", ylab="Count")



barchart(Youngprof$children, horizontal=FALSE, 
         main="Children", col="skyblue4", ylab="Count")


#Make a contingency table for gender and broadband
contable<-xtabs(~gender+broadband, data=Youngprof)
#Read the output from your table
contable

#Each time you open a new RStudio session, you need to run the following three commands.
#Highlight them and press Run or CTRL+ENTER
require(mosaic)
require(openintro)
require(MASS)

#Read in the north_ames dataset
north_ames<-read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/north_ames.csv")

#In this example we want to make a barchart for the nominal variable Roof.Style: 

#run the command below:
barchart(north_ames$roof_style)  # This tells R which variable to graph
#Notice the name of the data set, TwoStory is first, followed by a $ and
#the name of the variable Roof.Style

#change to vertical bars
barchart(north_ames$roof_style,  # This tells R which variable to graph
         horizontal = FALSE) # This tells R to graph vertical bars

#add chart label
barchart(north_ames$roof_style,      # This tells R which variable to graph
         horizontal = FALSE,   # This tells R to graph vertical bars
         main = "Roof Style")  #This creates the chart label

#change bar color
barchart(north_ames$roof_style,     # This tells R which variable to graph
         horizontal = FALSE,  # This tells R to graph vertical bars
         main = "Roof Style", # This creates the chart label. 
         col = "skyblue4")    # Notice the quotes around the title.
# This specifies the fill color of the bars.
# You can see a full list of colors to choose from 
# at http://research.stowers-institute.org/efg/R/Color/Chart/ColorChart.pdf

#change vertical axis label. Note ylab stands for y axis label.
#You can use the command xlab in a similar way to change the 
#horizontal x axis label if you like.
barchart(north_ames$roof_style,     # This tells R which variable to graph
         horizontal = FALSE,  # This tells R to graph vertical bars
         main = "Roof Style", # This creates the chart label
         col = "skyblue4",    # This specifies the fill color of the bars
         ylab = "Count")      # This creates the y-axis label


#Make a contingency table for Lot.Shape and Lot.Config
contable<-xtabs(~lot_shape+lot_config, data = north_ames)
#Read the output from your table
contable










barchart(north_ames$lot_config,horizontal = FALSE,main = "Lot Configuration",
         col = "skyblue4",ylab = "Count",xlab = "Size")

#THIS IS MY WORK
barchart(north_ames$lot_config, horizontal=FALSE, 
         main="Lot Configuration", col="skyblue4", ylab="Count", xlab="Location")

contable<-xtabs(~roof_style+one_story, data = north_ames)
contable
