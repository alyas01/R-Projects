
### Functions to be explored
# cut, quantile, sample, sort, duplicated,aggregate,list


l1 = list()
l1[(1)] = "a"
l1[(2)] = "b"
l1
##################### Merge  ################################

personal <- read.csv(file.choose())
#1. cbind 
df2 = CabsDataset_DF
df2$spd_km_hr<-df2$spd*1.8 

data("iris")

setosa=iris[iris$Species=="setosa",]
vers = iris[iris$Species=="versicolor",]

df2=cbind(setosa,vers) #this should work

str(iris)

#2. rbind 

names(setosa)
names(vers)

marks <- read.csv(file.choose())

cp <- personal[c(7,4,12,5,15,18,11), ]
cm <- marks[c(7,4,10,8,15,11,3), ]

#scenario - what if I interchange the column names 
vers=vers[,c(5,1,4,3,2)]
df3 = rbind(setosa,vers)

# change row names 
row.names(cp) <- 1:nrow(cp)
row.names(cm) <- 1:nrow(cm)

# cp & cm subset of personal and marks for demo purposes
cp
cm

# merge which matches on a primary key and then binds the columns
# Primary key : is the column which is common in both
# 1. Inner join : If the primary key is present in both left and right
# 2. Outer join : If the pk is present in either 
result_DF5 = merge(x=authors2, y=books, by.x="surname",by.y="name",all=T)
# 3. Left join  : If the pk is present in left only

# 4. Right join : If the pk is present in right only

# inner merge : all = FALSE
result_DF=merge(x=authors, y=books, by.x='surname',by.y='name')

unique(cp$Enrol.No.)
unique(cm$Enrol.No.)

merge(cp,cm, by =   'Enrol.No.', all = FALSE) 

# outer merge : all = TRUE

merge(cp,cm, by = 'Enrol.No.', all = TRUE) 

# left merge : all.x = TRUE

merge(cp,cm, by = 'Enrol.No.', all.x = TRUE) 

# right merge : all.y = TRUE

merge(cp,cm, by = 'Enrol.No.', all.y = TRUE)  


data("iris")
data("cars")
data("mtcars")

View(iris)
View(cars)
View(mtcars)

####################   Word Cloud #########################
# 
# install.packages("tm")
# install.packages("wordcloud")
# install.packages("RColorBrewer")

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
##Transformation is performed using tm_map() function to replace, 
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

#########################     ggplot2    ########################

#install.packages("ggplot2")
library(ggplot2)

df <- data.frame(dose=c("D0.5", "D1", "D2"),
                 len=c(4.2, 10, 29.5))
df

p<-ggplot(df, aes(x=dose, y=len)) +
  geom_bar(stat="identity", color="blue",fill="white")+ theme_minimal()   

#?ggplot2::geom_bar

p
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

####  Histogram   ####

ggplot(airquality,aes(x = Ozone))  + geom_histogram (aes (y = ..count..),
                                                     colour = "black", fill = "blue") +
scale_x_continuous(name = "Mean in ozone in \nparts per billion")+scale_y_continuous(name = "count")

############    BOXPLOT - BASE   #########

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

####   Boxplot -GGPLOT   #######

airquality$Month <- factor(airquality$Month , labels = c("May", "Jun", "Jul", "Aug","Sep"))
airquality$Month

ggplot (airquality, aes (x = Month, y= Ozone))+ geom_boxplot (fill = "blue", colour = "black")+
  scale_y_continuous (name = "Mean ozone in \nparts per billion",
                      breaks = seq (0, 175, 25), limits=c(0, 175))+ scale_x_discrete (name = "Month") +
  ggtitle ("Boxplot of mean ozone by month")

######## Practise : Map of India - library(ggmaps)#############

# install.packages("ggmap")

library(ggmap)

India <- c(left = 65, bottom = 5, right = 98, top = 36)
get_stamenmap(India, zoom = 5, maptype = "toner-lite") %>% ggmap()

