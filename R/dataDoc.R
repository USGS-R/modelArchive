#' Checks basic files and documentation in model archive.
#' 
#' @description
#' The \code{checkArchive} function checks that all files are documented in the readme and that each folder contains files.

#' @param dataFrame Data.frame object to document
#' @param file Filename of text file to contain output, should be the same name as datafile being described with no extension. If left NULL output prints to console. 
#'@examples
#'dataDoc(dataFrame = iris)
#'@import ascii
#'@export
#'

dataDoc <- function(dataFrame,file=NULL)
{
  types <- apply(dataFrame,2,typeof)
  
  metaData <- data.frame(variable = names(types),
                         dataType = types)
  metaData$description <- ""
  
  if(!is.null(file))
  {
  docfile <- paste0(getwd(),"/",file,".meta")
  file.create(docfile)
  sink(docfile)
  ascii(metaData,include.rownames=FALSE,caption=file)
  sink()
  }
  else {
    ascii(metaData,include.rownames=FALSE)
  }
}

