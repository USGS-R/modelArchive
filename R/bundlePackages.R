#' Bundles all packages required by model 
#' 
#' @description
#' The \code{makeReadMe} function generates a basic readme file describing the model and model archive directory structure

#' @param modelDescription String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param filePath Relative file path of folder cooresponding to model archive folder.
#' @import packrat
#'@examples
#'makeReadMe()
#'@export
#'
bundlePackages <- function(filePath = "modelArchive",repositories = c(CRAN = "http://cran.rstudio.com",
                                                     GRAN = "http://owi.usgs.gov/R"),
                           localRepos="") {

  packrat::off()
  
  ###If your using a repo other than CRAN, specify them here.
  ###You can add more repos with the same format seperated by comma, e.g. reponame = "repo path", reponame = "repo path"
  packrat::repos_add(repos=repositories)
  
  ###If you have a local package that you have made to support your analysis, set the path here
  ###The package name must be the same as the folder name that holds the package. For example, my support package "natTrends" 
  ###is in the folder ../USGS-R/natTrends
  
  packrat::set_opts(local.repos = localRepos)
  
  ###Select what project directory you would like to archive
  projectDir <- paste0(getwd(),"/",filePath)

  ###Initiallize the packrat project
  packrat::init(project=projectDir)
  

  ###Reset library to default
  packrat::off()
}
