#' Create a model archive folder
#' 
#' @description
#' The \code{createFolder} function creates a model archive folder with sub directories for required files. Defaults to current working directory.
#' 
#' @param path full file path to directory to place model archive folder
#' @param folderName character string of name for model archive folder.

#'@examples
#'createFolder()
#'@export
createFolder <- function(folderPath= NULL, folderName = "modelArchive") {
  if(is.null(folderPath))
  {
    folderPath = getwd()
  } 
  archiveFolder <- paste0(folderPath,"/",folderName)
  
  dir.create(path=archiveFolder)
  dir.create(path = paste0(archiveFolder,"/scripts"))
  dir.create(path = paste0(archiveFolder,"/input"))
  dir.create(path = paste0(archiveFolder,"/output"))
  dir.create(path = paste0(archiveFolder,"/R_files"))
  print(paste0("Model archive folder created in ",folderPath))
}
