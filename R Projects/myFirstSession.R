# x="Misha"
# print(x)
# 
# #use this comment 

#using R as a calculator 

#contol + Enter to execute the command from the script
10+90

10/4

# 7 raised to power 3 
7*7*7

7^3

#variable 

x <- 10*9
print(x)

# r supports integer value 
x=11
class(x)

myFirstVar = TRUE
class(myFirstVar)

myName = "Misha"
class(myName) 

myNumber = 1.90
x = as.integer(myNumber)
class(x)

val=11L
class(val)

#convert a date in characher into  Date format
dt="2020-01-31"
class(dt)

dt_format=as.Date(dt,format = "%Y-%m-%d" )

class(dt_format)

dt_format+1

dt_format-1

#vectors [array or collections
array = c(1,2,3)
class(array)

#vector subset 

array[c(2,3,5)]

#meaning of negative index value 
array[-1]

array[-3]

#special vector is a sequence vector 
sv = 5:10
class(sv)

-1:5
5:10
