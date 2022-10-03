# What is R? Introductory Slides

# Getting Help
?mean
??mean
?"%*%"

# Examples
example(mean)
example(sd)

###########################################################################################
# Simple Codes

# Arithmetic Operators
2+4
2^3
850/10
220-20

###########################################################################################
# Reading Data

# Inputting Data
x <- scan()
#now enter some numbers!
x
getwd()
dir()
setwd("C://PATH/TO/revanent-master")
dir()
easy <- read.table('simple.txt', header = TRUE, sep = "\t") 
head(easy)
View(easy)
plot(easy)
smoking <- read.csv('smoking.csv', header = T)
View(smoking)

# Data Frames
data(mtcars)
head(mtcars)
?mtcars

# The Environment
ls()

###########################################################################################
# Object Types

# Vectors
c(1,3,5)
c("H", "A", "B")
c(TRUE, 2, "Sky")
y <- c(x, 0, x)
y

# Matrix
matrix(c(1,6,5,3,2,7), 3, 2)

# Array
x <- c(1,6,5,3,2,7,1,6,5,3,2,7)
array(x, dim = c(3,2,2)) 

# List
list(name="Mary", spouse="Todd", no.children=3, child.ages=c(4,7,9))

###########################################################################################
# Data Wrangling

# Vector Refresher
c(3,4,5,6,7,8)
3:8
1:5*2
seq(2,10, by=2)
rep(3:8, times=2)
rep(3:8, each=2)

# Object Refresher
NumV <- 1:20
FacV <- factor(rep(letters[1:5], each=4))
SecondV <- rbinom(n=16, size=100, prob=.5)
M <- matrix(SecondV, nrow=4, ncol=4)
L <- list(a=1, b=1:3, c=10:100)

# Interrogating - hints for you...
str(NumV)
?rbinom

# Aggregation functions (*apply)
apply(M, 1, min)
apply(M, 2, max)
lapply(L, FUN = length)
lapply(L, FUN = sum)
sapply(L, FUN = length)
sapply(L, FUN = sum)
tapply(NumV, FacV, sum)

# Attaching a dataset
library(help = "datasets")
data(warpbreaks)
attach(warpbreaks)
# hint: a dataframe can also be inspected with str() and View()

# Advanced aggregation
by(warpbreaks[,1:2], tension, summary)
# summary is sensible: it gives quartiles for breaks and tabulation for tension - all "by" tension
aggregate(breaks, list(wool, tension), summary)
# notice that the output is now a dataframe itself

# Detaching a dataset (important)
detach(warpbreaks)

warpbreaks[,3]
warpbreaks$tension

###########################################################################################
# Functions

# Character Functions
test1 <- c("ATG","GTA","AGT", "TCG","ATG")
i <- grep("ATG", test1, fixed=TRUE)
i
test1[i] 
sub("ATG","AGT",test1)

###########################################################################################
# Basic Plots

# Single Variable
y <- rnorm(100, mean = 0, sd = 1)
plot(y)
?plot
plot(y, type = 'b')
plot(y, type = 'l')
plot(y, type = 'h')

# Two Variables
head(mtcars)
plot(mtcars$hp, mtcars$mpg)
boxplot(mpg~am, data=mtcars)

# Saving Plot
pdf(file="myplot.pdf", 7, 7)
par(col='red')
boxplot(mpg~am, data=mtcars)
dev.off()

###########################################################################################
# Summary Statistics

summary(smoking)
summary(mtcars)
sd(mtcars$mpg)
var(mtcars$mpg)

cor(mtcars$mpg, mtcars$wt)
cor.test(mtcars$mpg, mtcars$wt)
cor(mtcars)

aggregate(mtcars, by = list(row.names(mtcars)), FUN = "mean")

###########################################################################################
# Basic Statistics

# T test
x1 <- rnorm(100,0,1)
x2 <- rnorm(100,3,1)
t.test(x1, x2)

# Linear model
x <- c(1,3,5,7)
y <- c(2,8,13,19)
plot(x, y, xlab = "x", ylab = "y")

lm_model <- lm(y ~ x)
lm_model

abline(lm_model)
summary(lm_model)
anova(lm_model)

# Sample Size
power.t.test(n = 20, delta = 1)
power.t.test(power = .90, delta = 1)
power.t.test(power = .90, delta = 1, alternative = "one.sided")


###########################################################################################
# Tidyverse Introduction

# try to import dataset
arctic_df <- read.csv("NOAA_Arctic.csv")
# why didn't that work?
# better version
arctic_df <- read.csv("NOAA_Arctic.csv", comment.char = "#")

# even better
# load the tidyverse
library(tidyverse)
# notice that some objects (yes, even functions are objects) from other packages are masked

# using readr's method
arctic <- read_csv("NOAA_Arctic.csv", comment = "#")

# dplyr
filter(arctic, Month==1, Day==1)
filter(arctic, `Extent (10^6 sq km)` <= 3.5)

# some transformations
arctic <- rename(arctic, Extent=`Extent (10^6 sq km)`)
select(arctic, Year)
select(arctic, Year:Day)
mutate(arctic, logex=log(Extent))
transmute(arctic, logex=log(Extent))

# Summarising
# basic (and sorta pointless)
summarise(arctic, area=min(Extent))

# smarter when grouping the data
by_year <- group_by(arctic, Year)
by_year
min_ice <- summarise(by_year, area=min(Extent))
min_ice

# looking at what you are doing
(max_ice <- summarise(by_year,area=max(Extent)))
# look below!
# but you can still view the object
max_ice

# Piping data
( lean_yrs <- arctic %>%
    group_by(Year) %>%
    summarise(area=min(Extent)) %>%
    filter(area < 5) )

##GRAPHING##
# all on one slide
library(lubridate)
arctic %>%
  mutate(Date2=make_datetime(Year, Month, Day)) %>%
  mutate(DayinYear=as.numeric(format(Date2, "%j"))) %>%
  ggplot(aes(x=DayinYear, y=Extent, colour=Year)) +
  geom_point()


###########################################################################################
# Advanced Base package Graphics

# An old favourite
attach(mtcars)
# there are several examples given
plot(mtcars) # notice that the output is bonkers!

# Bar charts and aggregating counts
gear
counts <- table(gear)
counts
barplot(counts)

# Elaborating plots
barplot(counts/length(gear), names.arg=c("three","four","five"))
title(main="Car Distribution", xlab="Number of Gears", ylab="Relative Frequency")

# Bar charts with point estimates
heights <- tapply(mpg, gear, mean)
barplot(heights)
title(main="Mean Efficiency", xlab="Number of Gears", ylab="Miles per Gallon")

# Confidence intervals
install.packages('gplots') # don't repeat this if you've already done it!
library(gplots)

lower <- tapply(mpg, gear, function(i) t.test(i)$conf.int[1])
upper <- tapply(mpg, gear, function(i) t.test(i)$conf.int[2])
barplot2(heights, plot.ci=TRUE, ci.l=lower, ci.u=upper, ci.width=0.2)
title(main="Car Efficiency", xlab="Number of Gears", ylab="Miles per Gallon")
# Bored? pop some colours in with the "col" argument to the main function

# Multiple predictors
counts <- table(vs,gear)
# yes, that's a cross-tabulation, see:
counts
# now the main command
barplot(counts, col = c("lightblue","mistyrose"), legend = T, args.legend = list(title="vs"))
title(main="Car Distribution by Gears and VS", xlab="Number of Gears")
# note that we could get busy with *apply functions to do create 2-way point estimates...

# Distribution plots: boxplot
boxplot(mpg ~ am, names=c("Automatic", "Manual"))
title(main="Boxplot Showing Distribution", xlab="Transmission", ylab="Miles per US Gallon")

# Warning!
boxplot(am, mpg, names=c("all am value", "all mpg values"))
# this plot is spurious

# Distribution plots: violin plots
install.packages('vioplot')
library(vioplot)

# Subsetting with with()
auto <- subset(mpg, am==0, data=mtcars)
man <- subset(mpg, am==1, data=mtcars)

# Note for reader - see how we passed mtcars to data argument so we didn't have to type
# mtcars$mpg and mtcars$am? For completeness you can have the same effect (if the data
# argument is missing) by using the with() function:
auto <- with(mtcars, subset(mpg, am==0))
man <- with(mtcars, subset(mpg, am==1))

# also note that this can be done with the tidyverse (my preferred method), e.g.,
auto <- filter(mtcars, am==0) %>% select(mpg)
man <- filter(mtcars, am==1) %>% select(mpg)

# Violin plots
vioplot(auto, man, names=c("Automatic", "Manual"))
title(main="Violin Plot", xlab="Transmission", ylab="Miles per US Gallon")

# Distribution plots: histograms
hist(auto, col=rgb(1,0,0,0.5), breaks=seq(10,36,2), xlim=c(10,35), ylim=c(0,5), main="", xlab="")
hist(man, col=rgb(0,0,1,0.5), breaks=seq(10,36,2), add=T)
# notice the use of seq to define a vector and a precise way to declare colours with rgb()
title(main="Double Histogram", xlab="Miles per Gallon")
legend("topright", c("automatic","manual"), fill=c(rgb(1,0,0,0.5),rgb(0,0,1,0.5)))
# legend is a pretty complex function

# Advanced boxplots (base)
boxplot(mpg~vs*am, data=mtcars, col=(c("mistyrose","lightblue")))
title(main="Car Engines", xlab="Config * Transmission", ylab="Miles per gallon")

# Cleaning up
detach(mtcars)
rm(auto, man)
#### be careful with the next command ####
rm(list=ls())

# Controlling graphical parameters
setwd('~/Desktop/R course/') # correct this path!
array <- read.csv('heatmaps_in_r.csv', header = TRUE, comment.char="#", row.names = 1)
op <- par(cex.axis=0.6, las=2)
image(x=1:10, y=1:4, z=data.matrix(array), col=rev(heat.colors(10)), xlab='', ylab='')
hist(rnorm(100))

# Controlling graphics
par(op)
hist(rnorm(100)) # not so silly anymore
?par
?points
?colours
?image

# Writing to a device
pdf("nanoarray.pdf", 12, 6)
par(cex.axis=0.6, las=2)
image(x=1:10, y=1:4, z=data.matrix(array), col=rev(heat.colors(10)), xlab='', ylab='', axes=F)
axis(1, at=1:10, labels=rownames(array))
axis(2, at=1:4, labels=colnames(array))
title(xlab="sample", ylab="probe", cex.main=2)
dev.off()

# Using source()
source('makearray.R')
source('virus_genome.R') # this is equivalent to running all the lines in one go

###########################################################################################
# ggplot2: grammar of graphics

# ggplot2
#install.packages('ggplot2') # not needed if tidyverse installed already
library(ggplot2)
ggplot(mtcars, aes(x=gear, y=mpg)) + stat_summary(fun.y="mean", geom="bar")
# yes that was a plus sign: you add elements to a ggplot sequentially

# Building plots
counts <- table(mtcars$vs, mtcars$gear, dnn=list("vs", "gear"))
counts
barplot(counts, beside=T, legend=T)

# Bulding plots 2
t(counts)
barplot(t(counts), beside=T, legend=T)

plot(counts[1,], type="l")
lines(counts[2,], col="blue")

# With ggplot2
counts <- data.frame(table(mtcars$vs, mtcars$gear, dnn=list("vs","gear")))
counts
ggplot(counts, aes(x=factor(gear), y=Freq, colour=factor(vs), group=factor(vs))) +
  geom_line()

# Changing the geom
ggplot(counts, aes(x=factor(gear), y=Freq, fill=factor(vs))) +
  geom_bar(stat="identity", position="dodge")

# Barplot with error bars
( mtsum <- mtcars %>% group_by(gear) %>% summarise(mmpg=mean(mpg), ci=qnorm(0.975)*sd(mpg)/sqrt(length(mpg)) ) )

ggplot(mtsum, aes(x=gear, y=mmpg)) +
  geom_bar(stat="identity", colour="black", fill="mistyrose") +
  geom_errorbar(aes(ymin=mmpg-ci, ymax=mmpg+ci), width=0.2)

# Two factor boxplot
( mtsum <- mtcars %>% group_by(gear,vs) %>% summarise(mmpg=mean(mpg)) )

ggplot(mtsum, aes(x=gear, y=mmpg, fill=vs)) +
  geom_bar(stat="identity",position="dodge", colour="black")

# Resolving factors
ggplot(mtsum, aes(x=gear, y=mmpg, fill=factor(vs))) +
  geom_bar(stat="identity", position="dodge", colour="black") +
  scale_fill_brewer(palette="Pastel1")

# Scatter plot
install.packages('gcookbook')
library(gcookbook)
head(heightweight)
ggplot(heightweight, aes(x=ageYear, y=heightIn)) + geom_point()
ggplot(heightweight, aes(x=ageYear, y=heightIn, colour=sex)) +
  geom_point() +
  scale_colour_brewer(palette="Set1")

# Other plots
# basic violin plot
ggplot(mtcars, aes(x=factor(am), y=mpg)) +
  geom_violin()
# decorated violin plot (acknowledgement: recipe 6.9, Chang, W., 2012. R graphics cookbook: practical recipes for visualizing data. O'Reilly Media, Inc.)
ggplot(mtcars, aes(x=factor(am), y=mpg)) +
  geom_violin(trim=FALSE) +
  geom_boxplot(width=.1, fill="black", outlier.colour=NA) +
  stat_summary(fun.y=median, geom="point", fill="white", shape=21, size=2.5)

# basic histogram
ggplot(mtcars, aes(x=mpg)) + geom_histogram(fill="red", colour="black")

# advanced histogram
money=c(rnorm(10000,2,2), rnorm(10000,5,1))
mood=factor(rep(c("love","hate"), each=10000))
TB <- tibble(money, mood)
ggplot(TB, aes(x=money, fill=mood)) + geom_histogram(position="identity", alpha=0.4, colour="black")
## note how ggplot2 makes light work of organising data so you can focus on the key representation

# Facets (GFP Example)
gfp <- read.csv("gfp_test_data.csv")
pdf(file="GFP_bar.pdf", 8, 16)
basic <- ggplot(gfp, aes(x=factor(time), y=fluor, fill=interaction(ARA, ethanol)))
basic <- basic + geom_bar(colour="black", stat="identity", position="dodge")
basic <- basic + geom_text(aes(label=fluor), vjust=1.5, colour="white", position=position_dodge(.9), size=2.5)
basic <- basic + facet_grid(gain~., scales="free")
basic + scale_fill_manual(values=c("royalblue", "darkorange", "maroon"))
dev.off()

# Alternative way to save ggplot2 plots
ggsave("myplot.pdf")
# default behaviour - saves last plot created with ggplot2
