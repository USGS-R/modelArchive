#' Bundles all packages required by model 
#' 
#' @description
#' The \code{bundlePackages} function obtains all packages other than packages included in base R used in the model and bundles them for inclusion in the model archive.

#' @param filePath Relative file path of folder cooresponding to model archive folder.
#' @param repositories Named character vector containing urls of package repositories
#' @param localRepos Character string containing path to local local repository on disk for packages, if applicable. 
#' @import packrat
#'@examples
#'bundlePackages()
#'@export
#'
bundlePackages <- function(filePath = "modelArchive",
                           repositories = c(CRAN = "http://cran.rstudio.com",
                                            GRAN = "http://owi.usgs.gov/R"),
                           localRepos="") {
  wd <- getwd()
  packrat::off()
  
  ###If your using a repo other than CRAN, specify them here.
  ###You can add more repos with the same format seperated by comma, e.g. reponame = "repo path", reponame = "repo path"
  packrat::repos_add(repos=repositories,overwrite = TRUE)
  
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
  setwd(wd)
  
  ###Remove packrat options dir
  unlink(paste0(getwd(),"/packrat"),recursive = TRUE)
  ###Create library directory and remove packrat files
  # dir.create(paste0(projectDir,"/packages"))
  # file.copy(from=paste0(projectDir,"/packrat/src"),
  #           to=paste0(projectDir,"/packages"),
  #                     recursive=TRUE)
  # file.copy(from=paste0(projectDir,"/packrat/lib"),
  #           to=paste0(projectDir,"/packages"),
  #           recursive=TRUE)
  # unlink(paste0(projectDir,"/packrat"),recursive=TRUE)
  # file.remove(paste0(projectDir,"/.Rprofile"))
  # file.remove(paste0(projectDir,"/.gitignore"))
  
}
