#' Checks basic files and documentation in model archive.
#' 
#' @description
#' The \code{checkArchive} function checks that all files are documented in the readme and that each folder contains files.

#' @param dataFrame Data.frame object to document
#' @param file Filename of text file to contain output, should be the same name as datafile being described with no extension. If left NULL output prints to console. 
#' @param type type of text file formatting, can either by "ascii" for an ascii table or "tab" for tab delimited
#'@examples
#'dataDoc(dataFrame = iris)
#'@import ascii
#'@export
#'

dataDoc <- function(dataFrame,fileName=NULL,type="ascii")
{
  types <- lapply(dataFrame,class)
  types <- unlist(types)
  metaData <- data.frame(variable = names(types),
                         dataType = types)
  metaData$description <- ""
  
  if(!is.null(fileName))
  {
    if(type=="ascii")
    {
      docfile <- file(paste0(getwd(),"/",fileName,".meta"))
      sink(docfile)
      print(ascii(metaData,include.rownames=FALSE,caption=fileName))
      sink()
    } else if (type =="tab")
    {
      write.table(metaData,sep="\t",row.names=FALSE,quote=FALSE,file=paste0(getwd(),"/",fileName,".meta"))
    }
  } else {
    if(type=="ascii")
    {
      ascii(metaData,include.rownames=FALSE)
    } else if(type == "tab")
    {
      write.table(metaData,sep="\t",row.names=FALSE,quote=FALSE)
    }
  }
}

