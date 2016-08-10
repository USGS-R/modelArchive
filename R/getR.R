#' Downloads R version to include with archive
#' 
#' @description
#' The \code{getR} function downloads the appropriate version of R to include in the archive.
#' 
#' @param OS Operating system for R version. Can be one of "win","mac","linux", or any combination of the three.
#' @param rVersion Version of R to include, e.g. "3.1.1". Defaults to current version of R in use.
#' @param filePath Relative file path to store downloaded R files.
#'@examples
#'createFolder()
#'@export
getR <- function(OS="win",
                 rVersion = NULL,
                 filePath = "modelArchive/R_files") {
  
  if(any(!(OS %in% c("win"))))
  {
    stop("OS not specified correctly. Currently only supports windows. You may download your version manually at https://cran.r-project.org")
  } 
  
  if(is.null(rVersion))
  {
    rVersion <- paste0(R.Version()$major,".",R.Version()$minor)
  }
  
  if(as.numeric(substr(rVersion,start=1,stop=1)) < 3)
  {
    stop("This function only supports R versions > 3.0. You may download your version manually at https://cran.r-project.org")
  }
  
  if("win" %in% OS)
  {
    verTest <- try({
      download.file(url = paste0("https://cran.r-project.org/bin/windows/base/","/R-",rVersion,"-win.exe"),
                    destfile = paste0(getwd(),"/",filePath,"/R-",rVersion,"-win.exe"),
                    method="auto")
    },
    silent=TRUE)
    if(class(verTest) == "try-error")
    {
      download.file(url = paste0("https://cran.r-project.org/bin/windows/base/old/",rVersion,"/R-",rVersion,"-win.exe"),
                    destfile = paste0(getwd(),"/",filePath,"/R-",rVersion,"-win.exe"),
                    method="auto")
    } 
  }
  
}
