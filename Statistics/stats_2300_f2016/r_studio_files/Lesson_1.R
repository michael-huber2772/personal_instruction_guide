#RStudio Introduction video

#Require needed packages
require(MASS)
require(mosaic)
require(openintro)

#Calculate the average of the exam scores
#Using algebraic commands:
(78+73+92+85+75+98)/6
#Using R commands
mean(c(78,73,92,85,75,98))

#Calculate the sample standard deviation of the exam scores
sd(c(78,73,92,85,75,98))

#Make a data object of the exam scores
exams <- c(78,73,92,85,75,98)

#Calculate the variance of the exam scores
var(exams)

#Calculate several statistics at once
favstats(exams)

#View the Baseball dataset MLB
View(MLB)

#Run the command to create a barchart for position
barchart(MLB$position, main="Position", horizontal=FALSE, 
         ylab="Count", scales=list(x=list(rot=45)), col="skyblue3")

#Calculate statistics for salary
favstats(MLB$salary)

#Run the command to create a histogram for salary
hist(MLB$salary, col="skyblue3", 
     main="MLB Salaries", xlab="Salary (in $1000s)"

View(gradesTV)
favstats(gradesTV$Grades)
#Creating boxplots using R

#Require needed packages
require(MASS)
require(mosaic)
require(openintro)

#Create a boxplot of the MLB salary data
boxplot(MLB$salary)

#Create a horizontal boxplot of the MLB salary data with a title
boxplot(MLB$salary, horizontal=TRUE, main="MLB Salaries")

#Create side by side boxplots of MLB salaries based on position
boxplot(salary~position, data=MLB, las=2, cex.axis=0.6)
#That's messy!

#Create a simple side-by-side boxplot for a factor "treat" with
#just two options

boxplot(size~treat, data=Sitka)

#If you want to learn more about the Sitka data set, type
?Sitka
