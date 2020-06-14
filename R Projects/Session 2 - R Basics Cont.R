
#################### concatenation of the vectors ##########################

v1 <- c(23, 14, 10, 19, 11)
v2 <- c(1000, 5000)

c(v1,v2,v1)


################### Vector Multiplication ############################

# Same Length and have 5 elements 

v1 <- c(1,2,3,4,5)
length(v1)
v2 <- c(10,20,30,40,50)
v1*v2

# samelength

v1 * v2

# different length
v1 <- c(1,2,3,4,5,6) # 6 elements
v3 <- c(10,20,30) # 3 elements


v1 * v3






#larger vector length is a multiple of shorter vector length
# shorter vector is repeated that no. of times 
# v3 --> c(10,20,30,10,20,30)



######## Factors#######
y=factor(c("male","female","male","female","Others","Others","Others","male","female"))
y

y_new=as.factor(y)
y_new
class(y_new)

########  %in% operator
# %in% - Identify element that belongs to vector
a1 <- 8
a2 <- 12
a3 <- 3:10
print(a1 %in% a3) 
print(a2 %in% a3)


#################### FUnctions in R  #####################################

A <- c(10,20,30,4,50,60)
print(A)

?ls()
ls()

?rm
rm(A)

ls()

?range
range(A)


v1 <- c(1,2,3,4,5) # 5 elements
v3 <- c(10,20,30) # 3 elements
v1 * v3

# repeat vectors can be created manually 

years=c(2019,2020)
years
month = 1:12
month 
c(month, month)
rep(month,times=2)

rep(v3, times = 2)
rep(v3, each = 2)
rep(c(1,2,3), times = 20, length.out = 5)

?rev
rev(A)

?seq
seq(from=1,to=7,by=3)
seq(10,100,5)


?unique
x=c(1,2,3,4,5,1,2,3,4,5,1,2,3,4,5)
unique(x)

L="HELLO world"
L=tolower(L)
toupper(L)


round(2.56089,2)
ceiling(2.1)

## user defined function 
myFunc = function()
{
  print("welcome")
  print("How are you")
}

#now call the function 
myFunc()
library(swirl)
swirl()

my2ndFunc = function(age)
{
  cat("Hey your age is ", age)
}

my2ndFunc(23)

# create a function which takes 2 arguments and prints the sum

add2Nums = function(num1,num2){
  return sum(num1,num2)
}

add2Nums(2,3)

summary(A)
mean(A)
median(A)
var(A)
sd(A)
quantile(A)
str(A)

### Conditional statements ####
#Ifelse
user = "Misha"
age=56
if(user %in% c("Misha", "Ryan","Rida") & age>30)
{
  print("you have promo code of $50")
}

#take 2 numbers and print the bigger number 
if(num1>num2){
  print(num1)
}else{
  print(num2)
}

##write a function that would take an integar value and if its going to print or odd
num =4
if(num%%2==0){
  print("Even")
}else{
  print("Odd")
}
##---------------------------
B=21
if(B > 18){print("More")}else 
{print("less")}

ifelse(B>18,"More","Less")

if(8>18)
{print("more")}else
{print("less")}

#Switch
Name="Priyanka"
switch(Name,Priyanka={print("TRAINER")}, Other={print("STUDENT")})


#Nested statement
x <- 7

if (x < 0) {
  print("Negative number")
} else if (x > 0) {
  print("Positive number")
} else
  print("Zero")

####### Loops #######



# For Loop

Loop1 <-c(1,3,6,7)
for ( val in Loop1 )
{  print( val )}


#out of all the numbers in the array take only the odd numbers 
array = c(1,2,3,4,5)
for(val in array){
  if(val%%2!=0){
    print(val)
  }
}

##write a program using for loop which will count the odd and even numbers 
counter_odd = 0
counter_even = 0
for(x in array){
  if(x%%2==0){
    counter_even ++
  }else{
    counter_odd = counter_odd + 1
  }
}
#while  Loop
i <- 1
while (i < 6)
{  print(i)
  i = i+1}

#Repeat
x <- 1
repeat
{ print(x)
  x = x+1
  if (x == 6){
    break  }}



#######Loop control Statements

#Break
num <- 1:5
for (abc in num)
{if (abc == 3)
  break 
  print(abc)  }

#Next
num <- 1:5
for (abc in num)
{
  if (abc == 3)
  {
    next
  }
  print(abc)
}

#### Dataframes #########

name= c("Priyanka" ,"Deepika","Ranveer")
sex = c("F","F","M")
age = c(32,31,35)
occu = c("self","sal","")
test<- data.frame (name,sex,age,occu )
#View(test)

result1= data.frame(test$name, test$age)
#View(result1)
class(test)
head(test,1)

#slicing by subscript 
#DFNAME[ROWNUM, COLNUM]
test [3,2]
test [2]  

test [2,]  

##slicing through a condition - ex. subset data for smokers 

test[test$age>30,]
test[test$name=="Ranveer",]

#getting the data in excel file or csv - export 

getwd()

write.csv(x=test,file="Desktop/R-Projects/myFirstFile.csv")

#import a file header 

df=read.csv("Desktop/R-Projects/myFirstFile.csv")

  
###### List ######

list_data <- list(c("Red", "Green"), c(21,32,11), TRUE, 51.23, 119.1)
print(list_data)


# Create a list containing a vector, a matrix and a list.
list_data1 <- list(c("Jan","Feb","Mar"), matrix(c(3,9,5,1,-2,8), nrow = 2),
                   list("green",12.3))
print(list_data1)
# Give names to the elements in the list.
names(list_data1) <- c("1st Quarter", "A_Matrix", "A Inner list")

print(list_data1)
print(list_data[3])
print(list_data1$A_Matrix)


#merging 2 list
# Create two lists.
list1 <- list(1,2,3)
list2 <- list("Sun","Mon","Tue")

# Merge the two lists.
merged.list <- c(list1,list2)

print(merged.list)

#Assignment2 : Convert list into vector using UNLIST function


################################IMPORT#####################################################

###Excel ##
install.packages("readxl")
library( readxl )
setwd("C:/Users/Asus/Desktop/Priyanka/MU")
getwd()

wk = read_excel("Import_Export_xls.xlsx")


my_data <- read_excel(file.choose())

# Specify sheet by its name
my_data <- read_excel("Import_Export_xls.xlsx", sheet = "Text2")
View(my_data)

# Specify sheet by its index
my_data1 <- read_excel("Import_Export.xlsx", sheet = 2)

###Assignment : library("xlsx") ####


####Text File####
?read.table
Text_file= read.table("Import_Export.txt", header = TRUE,sep = "\t")
View(Text_file)
Text_file1= read.table("Import_Export_Pipe.txt", header = TRUE,sep = "|")
View(Text_file1)

text_2 = read.delim(file.choose())
View(text_2)


####CSV File

File_csv=read.csv("Import_Export.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE)
View(File_csv)

data_csv <- read.csv(file.choose())

str(File_csv)

#Assignment : Try importig datasets metioned on the LMS portal
