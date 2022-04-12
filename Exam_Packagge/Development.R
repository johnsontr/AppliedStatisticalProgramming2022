## Load libraries and set working directory
library(devtools)
library(roxygen2)

#Package directory
setwd("~/Documents/WashU/Year Two/R Class/Problem Sets/AppliedStatisticalProgramming2022/Exam_Packagge")
#Compiling my code and checking it
current.code <- as.package("easyPois")
check(current.code)
load_all(current.code)
document(current.code)

## loading package
setwd("~/Documents/WashU/Year Two/R Class/Problem Sets/AppliedStatisticalProgramming2022/Exam_Packagge/easyPois")
devtools::load_all()


## Let's look at a function
??`PoisMLE-class`
?logLik
?mle
?standarderror
?estimatePois


## Let's try it out
set.seed(123)
y <- rpois(100,50)
mle(y)
logLik(y, L = 50.47)

#calculating standard errors
standarderror(y,"bootstrap")
standarderror(y,"basic")

#Using the whole estimate function
pois <- estimatePois(y, "bootstrap")


# These are some tests to see if it fails correctly

#here we try and input some non positive numbers
y2 <- c(rpois(100,50), -1)
mle(y2)

#next we can try to run it with characters in our data
y2 <- c(rpois(100,50), "test")
mle(y2)

#What if we try and run the standard error function without a type
standarderror(y)

#We can try the whole estimation without a type
estimatePois(y)


