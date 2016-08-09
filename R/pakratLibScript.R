###Install and load the packrat library
library(packrat)
packrat::off()

###If your using a repo other than CRAN, specify them here.
###You can add more repos with the same format seperated by comma, e.g. reponame = "repo path", reponame = "repo path"
options(repos = c(CRAN = "http://cran.rstudio.com",
                  GRAN = "http://owi.usgs.gov/R"))

###If you have a local package that you have made to support your analysis, set the path here
###The package name must be the same as the folder name that holds the package. For example, my support package "natTrends" 
###is in the folder ../USGS-R/natTrends

packrat::set_opts(local.repos = "C:/Users/tmills/Documents/USGS-R")

###Select what project directory you would like to archive
###Only required if archiving a project outside of your current working directory
#project <- "pathtoyourprojectfolder"
projectDir <- getwd()

###Initiallize the packrat project
packrat::init(project=projectDir)

###
###Bundle it up to be included with model archive
packrat::bundle(project=projectDir,
                file="sktModelArchive.tar",
                overwrite=TRUE)

###Reset library to default
packrat::off()