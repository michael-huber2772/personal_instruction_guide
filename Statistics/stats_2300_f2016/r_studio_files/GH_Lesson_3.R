#Each time you open a new RStudio session, you need to run the following three commands.
#Highlight them and press Run or CTRL+ENTER
require(mosaic)
require(openintro)
require(MASS)

#View the MLB data set
View(MLB) #Look at the data frame to see the names of the variables

#make a frequency histogram of the variable salary.
#the hist command, by default, creates a frequency histogram
hist(MLB$salary) # We want the variable salary in the MLB dataset.
# Notice that we put the name of the dataset first, then $, then
# the name of the variable.

#Add labels and titles to your histogram
hist(MLB$salary, # This tells R which variable to graph
     main="Salary of MLB players", # This puts a title on the graph
     xlab="Salary", # This changes the label on the x-axis
     col="pink") # This changes the fill color of the bars 

#make a density histogram of the variable salary 
#by adding prob=TRUE to the hist command
hist(MLB$salary, # This tells R which variable to graph
     prob=TRUE,  # This tells R to make a density histogram
     main="Salary of MLB players", # This puts a title on the graph
     xlab="Salary", # This changes the label on the x-axis
     col="skyblue") # This changes the fill color of the bars 





north_ames<-read.csv("http://www.math.usu.edu/cfairbourn/Stat2300/RStudioFiles/data/north_ames.csv")
View(north_ames)


hist(north_ames$living_area, prob=TRUE,  main="Living area", xlab="Size of Living Area", 
     col="skyblue") 


hist(north_ames$sale_price, main="Sale Price", xlab="Sale Price", col="pink") 

