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
