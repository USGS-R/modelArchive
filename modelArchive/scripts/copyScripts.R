#' Copies script files to scripts folder in model archive
#' 
#' @description
#' The \code{copyScripts} function downloads the appropriate version of R to include in the archive.
#' 
#' @param scriptFiles character vector of script file names to copy to scripts directory in model archive folder. If NULL defaults to all files in working directory with .R extension.
#'@examples
#'copyScripts()
#'@export
getR <- function(scriptFiles = NULL,filePath = "modelArchive/scripts") {
  
if(scriptFiles = NULL)
{
  scriptFiles <- list.files(pattern="\\.R$",recursive=TRUE)
} else {
  scriptFiles <- list.files(pattern=scriptFiles,recursive=TRUE)
}

  
    
}