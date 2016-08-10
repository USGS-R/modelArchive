#' Opens a bundled archive.
#' 
#' @description
#' The \code{unbundleArchive} function opens a model archive created using \code{bundleArchive} and sets the current R library to that stored in the bundled archive.

#' @param bundle The full path to the bundled model archive.
#' @param where The full path to where the unbundled archive is to be placed.
#' @import packrat
#'@examples
#'unbundleArchive(bundle="sharedArchive.tar.gz",where = "myReviewFolder")
#'@export
#'
unbundleArchive <- function(bundle,
                          where) {
  if(!dir.exists(where))
  {
    dir.create(where)
  }
  
  wd <- getwd()
  packrat::off()
  

  packrat::unbundle(bundle=bundle,where = where)
  packrat::off()
  setwd(wd)
  
  ###Check R version
  files <- list.files(where,recursive=TRUE,full.names=TRUE)
  verTest <- scan(files[grep("packrat.lock",files)],what="character",sep=NULL)
  rVersion <- paste0(R.Version()$major,".",R.Version()$minor)
  if(rVersion != verTest[6])
  {
    warning(paste0("You are running R version ",rVersion," and the model archive was created using R version ",
                   verTest[6],". Please rerun this function and review archive using R version ",verTest[6],
                   ". The installation file for this R version should be present in the folder 'R_files' inside the model archive folder.")
    )
  }
}
