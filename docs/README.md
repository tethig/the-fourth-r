## Introduction
Welcome to the Dickins lab R learning resource. As well as being the [title of a novel](https://en.wikipedia.org/wiki/The_Fourth_%22R%22) "the fourth R" alludes to the concept of the three Rs, that is: **R**eading, w**R**iting and a**R**ithmetic, skills considered essential for accessing wider learning. [R](https://www.r-project.org) arguably deserves a place in this list. R is a high-level language with strengths in statistical calculation and graphics. Learning R will give you the ability to program a computer, analyze many types of data and construct visually appealing and informative graphs to represent data and analyses.

This page provides a starting point for R learning. It can be viewed online, but to follow along interactively you also need to download a copy of the GitHub repository on which this page is based.

## Download a Copy
You may download a copy of this "repository" by clicking on [this link](https://github.com/tethig/the-fourth-r/archive/refs/heads/main.zip). This will download a copy of a folder called "the-fourth-r-main" on your computer. The folder is zipped and your browser is likely to have placed it in your "Downloads" folder. Please ensure you unzip its contents ("Extract All" if using Windows) and move it to a convenient location such as your Desktop.

## Following Online
Please follow the links in this table to view content online:

| Level  | Skill                     | Location                | Link                                                                                   |
|--------|---------------------------|-------------------------|----------------------------------------------------------------------------------------|
| 1      | what is R?                | what-is-r/              | [Quarto Presentation](https://bendickins.net/what-is-r/)                               |
| 2      | basic plots and tidy data | the-fourth-r-main/docs/ | [HTML R Markdown](scatter-plots.html)                                                  |
| 3      | Penguin Workshop          | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/PenguinsWorkshop.pdf)                                 |
| 4      | simple codes              | the-fourth-r-main/docs/ | [Quarto Presentation](docs/simple-codes.html)                                          |
| 6      | object types              | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/3-object-types.pdf)                                   |
| 5      | reading data              | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/2-reading-data.pdf)                                   |
| 7      | data wrangling            | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/4-data-wrangling.pdf)                                 |
| 8      | function                  | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/5-functions.pdf)                                      |
| 9      | baic plots                | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/6-basic-plots.pdf)                                    |
| 10     | summary statistics        | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/7-summary-statistics.pdf)                             |
| 11     | basic statistics          | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/8-basic-statistics.pdf)                               |
| 12     | introduction to tidyverse | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/9-tidyverse-introduction.pdf)                         |
| 13     | advanced base graphics    | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/10-advanced-base-graphics.pdf)                        |
| 14     | ggplot2 graphics          | the-fourth-r-main/pdfs/ | [PDF Document](../blob/main/pdfs/11-ggplot2-graphics.pdf)                              |
| 15     | time series               | the-fourth-r-main/      | [Jupyter Notebook](https://github.com/tethig/the-fourth-r/blob/main/time-series.ipynb) |
| 16     | bonus material            | the-fourth-r-main/      | [GitHub Markdown](https://github.com/tethig/the-fourth-r/blob/main/bonus-material.md)  |

Notes:
- Time Series Data: these data are from my fitness tracker and are in a JSON-like format. So this example, shows how to wrangle data, read JSON and handle themes and times in ggplot2.
- Heatmap Data: these data are similar to microarray data although they are smaller in extent and not derived from an experiment. Data from [this site](http://www.sbeams.org/sample_data/) [accessed 07/05/2015].

## Installing R
If you have your own computer it is easy to install R. You can do so via the Comprehensive R Archive Network (CRAN). To do this you can use your search engine to find "R" and from the R homepage choose a local mirror site ([direct link here](https://cran.r-project.org/mirrors.html)). This works for all major operating systems. Mac users may, however, also find nightly builds on [this bleeding-edge repository](https://mac.r-project.org). While R is all you need, I strongly recommend using an "Integrated Development Environment" (IDE) while you learn. This is a piece of software that allows you to see extra information (such as what's in the computer memory, help pages and plots) in an organised layout on your screen. Probably the most popular IDE, and the one I recommend, is the [RStudio Open Source Edition](https://www.rstudio.com/products/rstudio/download/).

## Additional Tools
You may view Jupyter Notebook files using Jupyter Notebook or Jupyter Lab (recommended installation via ana|miniconda) and R Markdown documents can be read by RStudio. I may add some details on this in my [tips and tricks repository](https://github.com/tethig/turbo-spoon) or in the class, but you can simply follow the online links given above to view these files.

## Recommended Reading
I recommend the following resources for further study of R:
- [Tidyverse Homepage](https://www.tidyverse.org): a useful reference point for working with these libraries.
- [R for Data Science](https://r4ds.had.co.nz): a comprehensive book which teaches many aspects of R (from data organisation through plotting to R markdown) with an emphasis on the tidyverse.
- [R Graphics Cookbook](https://r-graphics.org): the second edition of this reference guide for plotting is most helpful.
- [R Graph Gallery](https://www.r-graph-gallery.com): a great place to go for plotting ideas and for coded examples of many common and rare plots.
- [Quick R](https://www.statmethods.net/): a useful reference site for basic statistical analyses in R
