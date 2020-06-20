####################Exporting############################

##Export in excel
### Assignment :install.packages("xlsx")/openxlsx

data("iris")
data("cars")
data("mtcars")

View(iris)
View(cars)
View(mtcars)

#install.packages("writexl")
library(writexl)

getwd()
write_xlsx(iris, "Desktop/iris.xlsx")

# Create excel sheets of each dataframe
write_xlsx(list(iris_1 = iris, cars_1 = cars, mtcars_1 = mtcars), "Desktop/mydata.xlsx")

##https://libxlsxwriter.github.io/ - for formated xl output

#export table - on the same path as set
help( write.table )
write.table (mtcars , "mydata.txt", sep =" \t")

#export csv - on the same path as set
write.csv( mtcars ,file = "mydata.csv")

#export csv - on the same path as set
View(my_data)

write.csv( bankcustomer1 ,file = "mydata.csv")
data(iris)
View(iris)


?grep
# Quantifiers specify how many repetitions of the pattern.
# *: matches at least 0 times.
# +: matches at least 1 times.
# ?: matches at most 1 times.
# {n}: matches exactly n times.
# {n,}: matches at least n times.
# {n,m}: matches between n and m times.

strings <- c("a", "ab", "acb", "accb", "acccb", "accccb", "ac")
print(strings)

grep("ac*b", strings, value = FALSE)  
grep("ac+b", strings, value = TRUE)
grep("ac{1,4}b", strings, value = TRUE)


#Position of pattern
# ^: matches the start of the string.
# $: matches the end of the string.

grep("^ac", strings, value = TRUE)
grep("cb$", strings, value = TRUE)


####update.packages(checkBuilt=TRUE, ask=FALSE)

#Data Undertanding: 1.How many records,2.how many variables are available & Formats
#3.Target variables,4.iNVALID/MISSIng values,5.outliers,6.Distribution of each variable
#7.visualise data for insights, 7.summary statistics



# dplyr pacakage-it is a grammar of data manipulation,helps to solve data manipulation challenges#

#install.packages("dplyr")
library(dplyr)
data(mtcars)
View(mtcars)
?mtcars

name(iris)
colnames(iris)

##select() - picks variables based on their names.
select()
select(mtcars,mpg,disp)
dplyr::select(mtcars,mpg,disp)
A=dplyr::select(mtcars,drat:carb)
View(A)

# filter() picks cases based on their values.
B=dplyr::filter(mtcars, cyl==8 )
View(B)
C=dplyr::filter( mtcars , cyl <6 & vs==1)
View(C)

## how to link select and filter 
iris %>% select(-sepal.Length,-species) %>% filter(species=="versicolor" & sepal.Length>5)

# arrange() changes the ordering of the rows.- sorting
dplyr::arrange(mtcars,disp)
dplyr::arrange(mtcars,cyl,disp)
D=dplyr::arrange(mtcars,desc(disp))
View(D)

# mutate() adds new variables that are functions of existing variables
mtcars1=dplyr::mutate(mtcars,custom_disp=disp/vs)
View(mtcars1)

#sorting petal width and lenth


# summarise() reduces multiple values down to a single summary.
dplyr::summarise(mtcars,m=mean(disp),v=mean(vs),sd=sd(vs),first(disp),median(disp))


iris %>% summarize(nbr_records=n(),v=mean(vs))

#what if I want to get the summary of all the fields by species type 
name(iris)
df3 = dplyr::select(iris) %>% group_by() %>% summarize(avg_sp = mean(Sepal.Length))

#Assignment:Practise all dplyr command on below dataset and also other summary functions
data(iris)
View(iris)

## create a dataframe with calculated Field Ratio - which is the ratio of Sepal length and Petal length 
calField <- data.frame()

df2 = iris %>% filter(Species='setosa')%>% mutate(ratio=Sepal.Length/Petal.Length)
df3= dplyr:: select(iris,Sepal.Length,Sepal.Width,Species) %>% group_by(Species) %>%  summarize(nbr_records=n(),avg_sp_len=mean(Sepal.Length),avg_sep_wid=mean(Sepal.Width))
##### Apply functions in R ############# 1- rows, 2-columns
?apply 

mat <- matrix(1:10,nrow=5, ncol=6)
mat
a_m1 <- apply(mat, 2, sum)
a_m1
a_m2 <- apply(mat, 1, sd)
a_m2


?lapply   # returns a list of the same length as X
movies <- c("SPYDERMAN","BATMAN","VERTIGO","CHINATOWN")
str(movies)
movies_lower <-lapply(movies, tolower)
str(movies_lower)

apply(X=iris[,-5], MARGIN = 2, FUN=mean)

#to convert into a vector
movies_lower <-unlist(lapply(movies,tolower))
str(movies_lower)

#sapply

dt <- cars
?cars
View(cars)
lmn_cars <- lapply(dt,min)
smn_cars <- sapply(dt, min)
lmn_cars
smn_cars  

avg <- function(x) {( min(x) + max(x) ) / 2}
fcars <- sapply(dt, avg)
fcars

list1 <- list(a = c(1,2,7,8), b=c(3,4,9,10), c=c(5,6,11,12)) 
print(list1)
sapply (list1,sum )
sapply(list1,range)    

#tapply : function tapply() computes a measure (mean, median, min, max, etc..)
data(iris)
View(iris)
tapply(iris$Sepal.Width, iris$Species, median)

#mapply : mapply applies a Function to Multiple List or multiple Vector Arguments
Q=matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)),4,4)
Q

Q=mapply(rep,1:4,4)
Q


##Assignmen : try cbind & rbind
#hint : it is used on dataframes

#######################  Visulization     ################################


install.packages("rpivotTable","esquisse")

library(rpivotTable)
library(esquisse)

rpivotTable(uber)

esquisse::esquisser()

####################Barplot#####################
data("mtcars")
View(mtcars)
barplot(mtcars$disp)

table(mtcars$gear)

?table
#it is a group by command
counts = table(mtcars$gear)
print(counts)
barplot(counts)
#Horizontal Bar plot
dev.off()
barplot(counts,horiz = TRUE)

barplot(counts,main = "Bar Plot" , xlab = "Disp",
        ylab = "Frequency", names=c("High","Medium","Low") ,
        legend=rownames(counts),col=c("red","yellow","green"))

counts1=table(mtcars$vs,mtcars$gear)
View(counts1)
#Stacked Barplot : Data has 2 categorys
barplot(counts1,main="Car Distribution by Gears and VS", 
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts1))

#Bars besides
barplot(counts1,main="Car Distribution by Gears and VS", 
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts1),beside = TRUE)


#################Piechart######################################
slices= c(10,8,7,6,5)
Lbls=c("India","Australia","US","UK","France")
?pie
pie(slices,labels=Lbls,main="Pie Chart")

#Pie with  %
pct=(slices/sum(slices)*100)
print(pct)
?paste
Lbls1=paste(c("India","Australia","US","UK","France")," ",round(pct,2),"%",sep="")
Lbls1

pie(slices,labels=Lbls1 , col=rainbow(5),main = "Pie with %")  



####Visulization########

####################Barplot#####################
data("mtcars")
View(mtcars)
barplot(mtcars$disp)

?table
#it is a group by command
counts = table(mtcars$gear)
print(counts)
barplot(counts)
#Horizontal Bar plot
dev.off()
barplot(counts,horiz = TRUE)

barplot(counts,main = "Bar Plot" , xlab = "Disp",
        ylab = "Frequency", names=c("High","Medium","Low") ,
        legend=rownames(counts),col=c("red","yellow","green"))

counts1=table(mtcars$vs,mtcars$gear)
View(counts1)
#Stacked Barplot : Data has 2 categorys
barplot(counts1,main="Car Distribution by Gears and VS", 
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts1))

#Bars besides
barplot(counts1,main="Car Distribution by Gears and VS", 
        xlab="Number of Gears",
        col=c("grey","cornflowerblue"),
        legend = rownames(counts1),beside = TRUE)


#################Piechart######################################
slices= c(10,8,7,6,5)
Lbls=c("India","Australia","US","UK","France")
?pie
pie(slices,labels=Lbls,main="Pie Chart")

#Pie with  %
pct=(slices/sum(slices)*100)
print(pct)
?paste
Lbls1=paste(c("India","Australia","US","UK","France")," ",round(pct,2),"%",sep="")
Lbls1

pie(slices,labels=Lbls1 , col=rainbow(5),main = "Pie with %")  

# 3 dimensional pie
install.packages("plotrix")
library(plotrix)
slices <- c(10, 12,4, 16, 8)
pct=(slices/sum(slices)*100)
pct
dev.off()
lbls<- paste(c("US", "UK", "Australia", "Germany", "France"), " ", round(pct,2) , "%", sep ="")
pie3D(slices, labels=lbls,explode=0.2,main="3D Pie Chart",labelcex=1) 


##########Histogram#######
data("mtcars")
View(mtcars)
hist(mtcars$mpg)
hist(mtcars$mpg,breaks = 5,col = "blue",border = "red")


######Kernel Density Plot - This chart is a variation of a Histogram that uses kernel smoothing 
# to plot values,allowing for smoother distributions by smoothing out the noise.###
?density
density_data <-density(mtcars$mpg)
density_data
plot( density_data)
#add color to the plot
polygon(density_data,col="skyblue",border="red")



#####Line Chart###
##Baby MOM weight & Height after birth
Weight<-c(2.5, 2.8, 3.2, 4.8, 5.1,5.9,6.8,7.1,7.8,8.1)
height<-c(1.6,1.8,2.0,2.1,2.2,2.4,2.5,2.7,2.8,2.9)
month<- c(0,1,2,3,4,5,6,7,8,9)
dev.off()
plot(Weight,month,type = "b", main = "Baby Weight Chart", pch=10, col=22)
lines(height,month,type="c",pch=5, col=564)

colors()           
?plot


############BOXPLOT#########

data("airquality")  
View(airquality)
?airquality

sort(unique(airquality$Ozone))
boxplot(airquality$Ozone, main="Ozone at New York",
        xlab="parts per billion",ylab="ozone",
        horizontal = FALSE,col=53)

summary(airquality$Ozone)
str(airquality$Ozone)
?boxplot

#Assignment 1 : Legends, change values of X-axis & y-axis, how to add labels
#assignment : how can you have multiple boxlot in the same chart
##########HeatMap##########        
?scale
df= scale(mtcars)
View(df)
heatmap(df)
heatmap(df,scale = "column", col = heat.colors(256), main="Cars",Rowv = NA,Colv = NA)
#native palettes of R:terrain.color,rainbow,heat.colors,topo.colors or cm.colors OR library(Rcolorbrewer)
par(mar=c(1,1,1,1))

###########Word Cloud #######
install.packages("tm")
install.packages("wordcloud")
install.packages("RColorBrewer")
library(tm)
library(wordcloud)
data= file.choose()
setwd("C:/Users/Asus/Desktop/Priyanka/Simpli learn/April-2020/Datasets")
getwd()
data=read.csv("Word_cloud.csv",header = T,stringsAsFactors = F)
str(data)
data=data.frame(data)
View(data)
head(data)
tail(data)

colnames(data) <- c("doc_id", "text") 

#Cleaning the data
Word1=Corpus(DataframeSource(data))
head(Word1)
#corpus represents a collection of (data) texts, typically labeled with text annotations
?Corpus
Word1[[1]][1]

Corpus = tm_map(Word1, content_transformer(tolower))
Corpus = tm_map(Corpus, removeNumbers)
Corpus = tm_map(Corpus, removeWords,stopwords("english"))
Corpus = tm_map(Corpus, removePunctuation)
Corpus = tm_map(Corpus,stripWhitespace)

#Creating a TDM
# A document-term matrix or term-document matrix is a mathematical 
# matrix that describes the frequency of terms that occur in a collection of documents.
tdm =TermDocumentMatrix(Corpus)
m=as.matrix(tdm)
v=sort(rowSums(m),decreasing = TRUE)
d = data.frame(word=names(v), freq=v)
View(d)
wordcloud(words=d$word,freq=d$freq,min.freq=1,max.words=100,random.order=F, rot.per=0.35,
          colors=brewer.pal(8,"Dark2"))
par(mar=c(1,1,1,1)) 
warnings()
d$word
d$freq


#########################ggplot2######example

install.packages("ggplot2")
library(ggplot2)

df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))
df

p<-ggplot(df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", color="blue",fill="white")+ theme_minimal()   
?ggplot2::geom_bar

p+coord_flip()      

#### Density Plot #######
df <- data.frame(
  sex=factor(rep(c("F", "M"), each=200)),
  weight=round(c(rnorm(200, mean=55, sd=5),
                 rnorm(200, mean=65, sd=5))))

View(df)
p <- ggplot(df, aes(x=weight)) +   geom_density()
p
# Add mean line
p+ geom_vline(aes(xintercept=mean(weight)),
              color="blue", linetype="dashed", size=1)

ggplot(df, aes(x=weight, color=sex)) +
  geom_density()

####Histogram####

ggplot(airquality,aes(x = Ozone))  + geom_histogram (aes (y = ..count..),
                                                     binwidth= 5, colour = "black", fill = "blue")
scale_x_continuous(name = "Mean in ozone in \nparts per billion", breaks = seq(0, 175, 25),
                   limits=c(175))+scale_y_continuous(name = "count")


############## Boxplot#######
airquality$Month <- factor(airquality$Month , labels = c("May", "Jun", "Jul", "Aug","Sep"))
airquality$Month

ggplot (airquality, aes (x = Month, y= Ozone))+ geom_boxplot (fill = "blue", colour = "black")
+ scale_y_continuous (name = "Mean ozone in \nparts per billion",
                      breaks = seq (0, 175, 25), limits=c(0, 175))+ scale_x_discrete (name = "Month") +
  ggtitle ("Boxplot of mean ozone by month")


####pRACTISE : Example 2
install.packages("tm")  # for text mining
install.packages("SnowballC") # for text stemming
install.packages("wordcloud") # word-cloud generator 
install.packages("RColorBrewer") # color palettes
# Load
library("tm")
library("SnowballC")
library("wordcloud")
library("RColorBrewer")

# Read the text file from internet
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-king-i-have-a-dream-speech.txt"
text <- readLines(filePath)
# Load the data as a corpus
docs <- Corpus(VectorSource(text))
inspect(docs)
##ansformation is performed using tm_map() function to replace, 
#for example, special characters from the text.
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")

#Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
# docs <- tm_map(docs, stemDocument)

#Document matrix is a table containing the frequency of the words. Column names are words and row names are documents.
#The function TermDocumentMatrix() from text mining package can be used as follow
dtm <- TermDocumentMatrix(docs)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)


set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colorPalette = "black")

######## Practise : Map of India - library(ggmaps)#############

install.packages("ggmap")
library(ggmap)
India <- c(left = 65, bottom = 5, right = 98, top = 36)
get_stamenmap(India, zoom = 5, maptype = "toner-lite") %>% ggmap()

#######Practise :Corelatio plot#########
install.packages("MASS")
library(MASS)
data("Boston")
?Boston
View(Boston)

#Check corealtion
data(boston)
install.packages("corrplot")
library(corrplot)
corr=cor(Boston)
corrplot(corr, type = "lower")



