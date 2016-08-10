#' Copies script files to scripts folder in model archive
#' 
#' @description
#' The \code{copyScripts} function downloads the appropriate version of R to include in the archive.
#' 
#' @param scriptFiles character vector of script file names to copy to scripts directory in model archive folder. If NULL defaults to all files in working directory with .R extension.
#' @param filePath file path of folder to copy scripts to.
#'@examples
#'copyScripts()
#'@export
#'
copyScripts <- function(scriptFiles = NULL,filePath = "modelArchive/scripts") {
  
if(is.null(scriptFiles))
{
  scriptFiles <- list.files(pattern="\\.R$",recursive=TRUE)
} else {
  scriptFiles <- list.files(pattern=scriptFiles,recursive=TRUE)
}

  file.copy(scriptFiles,to=filePath)
  
    
}