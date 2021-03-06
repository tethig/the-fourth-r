# Bonus Material
## Inputting Data

### Direct Data Entry
We've mentioned the ```scan()``` function, but didn't give an example. This is because your most likely use case is that you already have some data. Should you want to input data manually and record the results in a variable (let's call it ```x```), you can easily do so:

```R
x <- scan()
13 2 1.2 3 18 6
```
You can then use ```x``` as a regular vector (see earlier slides). The ```scan()``` function is known as a base function: its functionality underlies the convenience functions we discuss.

### From Excel to R
The main example of data entry I gave is fetching data from a comma-separated values (csv) file, which is a format you can save to from Microsoft Excel (and from other software) quite easily. In my opinion it is a good idea to use this format because it forces you to be sparse and to focus on the key information required from the outset. But it is also possible to import from Excel files directly. For this you will need to load a package called "readxl". Here is the minimal approach:

```R
install.packages("readxl") # you need only do this the first time
library(readxl)
vision <- read_excel('prescription.xlsx')
boxplot(vision$axis ~ vision$eye) # plotting already!
```
But you might want to take a [look here for more information](http://readxl.tidyverse.org).

## Inspecting Data in RStudio
Are you confused about the ```View()``` command that came up? ```View()``` is a specialist RStudio function that makes use of the window layout and allows you to view a nicely formatted version of an object. (And yes, that is with a capital "V" to distinguish it from R functions). In R.app ```head()``` and ```tail``` will have to be your friends.

## Plots with Multiple Predictors
In the two-variable plots we looked at scatter plots and boxplots with only one predictor. It is also possible to plot data with two predictors. Assuming you already have the mtcars dataset loaded, you can try an interaction plot:

```R
interaction.plot(mtcars$gear, mtcars$vs, mtcars$mpg)
```
The middle argument here sets the variable to be use as a *tracing factor*.

But what about box plots with >1 predictor? Yes, this is totally doable:
```R
boxplot(mpg ~ vs * am, data = mtcars, col = c("mistyrose", "lightblue"), main = "Car Engines", xlab = "Config * Transmission", ylab = "Miles per Gallon")
```
Notice how the ```data``` argument saves some repitition and make the formula in the first argument much easier to read. This example also shows a selection of arguments to add titles and axis labels. Try adding another argument to this: ```notch=TRUE``` to see what happens.

## Advanced Plots: Simple Examples
R's plotting capabilities are incredible. The examples below give just a flavour of some of the power of some R libraries:

### Contour, heat and 3D plots with MASS
```R
library(MASS)
x <- rnorm(100, 10,2)
y <- -0.5 + 0.67 * x + rnorm(100,0,0.2)
bivn.kde <- kde2d(x,y, n = 50)
op <- par(mfrow = c(2,2)) # set up multi-plotting
contour(bivn.kde)
image(bivn.kde)
persp(bivn.kde, phi = 10, theta = 30,col="grey")
par(op)
```

### Bar Charts using the Grammar of Graphics
I, like many others, am a big fan of ggplot2() - part of the [tidyverse family](http://tidyverse.org) of R packages. This example uses data from the Excel file loaded above:

```R
install.packages("ggplot2") # you need only do this the first time
library(ggplot2)
ggplot(vision, aes(x=optometrist, y=cylinder, fill=axis)) + geom_bar(stat='identity') + facet_grid(eye~.)
```