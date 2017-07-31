.onAttach <- function(libname, pkgname) {
  packageStartupMessage("This information is preliminary or provisional and
is subject to revision. It is being provided to meet
the need for timely best science. The information
has not received final approval by the U.S. Geological
Survey (USGS) and is provided on the condition that
neither the USGS nor the U.S. Government shall be held
liable for any damages resulting from the authorized
or unauthorized use of the information.

****Orphaned Package****
This package is looking for a new maintainer. For more information, 
see: https://owi.usgs.gov/R/packages.html#orphan")
}

#' Bundles the model archive into a .tar archive to share with reviewers.
#' 
#' @description
#' The \code{bundleArchive} function Bundles the model archive into a .tar archive to share with reviewers.

#' @param filePath Relative file path of folder cooresponding to model archive folder.
#' @param bundleName The filename of the tar archive that holds the model archive bundle.
#' @import packrat
#'@examples
#'bundleArchive()
#'@export
#'
bundleArchive <- function(filePath = "modelArchive",
                           bundleName = "modelArchive.tar.gz") {
  wd <- getwd()
  packrat::off()
  
  projectDir <- paste0(getwd(),"/",filePath)
  
  packrat::bundle(project=projectDir,file=paste0("../",bundleName))
  packrat::off()
  setwd(wd)
}
