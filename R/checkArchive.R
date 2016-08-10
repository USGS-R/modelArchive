#' Checks basic files and documentation in model archive.
#' 
#' @description
#' The \code{checkArchive} function checks that all files are documented in the readme and that each folder contains files.

#' @param filePath Relative file path of folder cooresponding to model archive folder.
#'@examples
#'makeReadMe()
#'@export
#'
checkArchive <- function(filePath = "modelArchive") {
  
  errors <- character()
  
  #print("Checking input directory")
  
  if(dir.exists(paste0(getwd(),"/",filePath,"/input")))
  {
    if(length(list.files(paste0(getwd(),"/",filePath,"/input"))) == 0)
    {
      errors <- c(errors," Input directory contains no input files")
    } else {"OK"}
    
  } else{errors <- c(errors,"No input directory found")}
  
  #print("Checking output directory")
  
  if(dir.exists(paste0(getwd(),"/",filePath,"/output")))
  {
    if(length(list.files(paste0(getwd(),"/",filePath,"/output"))) == 0)
    {
      errors <- c(errors," output directory contains no output files")
    } else {"OK"}
    
  } else{errors <- c(errors,"No output directory found")}
  
  #print("Checking R_files directory")
  
  if(dir.exists(paste0(getwd(),"/",filePath,"/R_files")))
  {
    if(length(list.files(paste0(getwd(),"/",filePath,"/R_files"))) == 0)
    {
      errors <- c(errors,"R_files directory contains no files")
    } else {"OK"}
    
  } else{errors <- c(errors," No R_files directory found, run getR()")}
  
  #print("Checking scripts directory")
  
  if(dir.exists(paste0(getwd(),"/",filePath,"/scripts")))
  {
    if(length(list.files(paste0(getwd(),"/",filePath,"/scripts"))) == 0)
    {
      errors <- c(errors," scripts directory contains no files")
    } else {"OK"}
    
  } else{errors <- c(errors," No scripts directory found, run copyScripts()")}
  
  #print("Checking scripts directory")
  
  if(dir.exists(paste0(getwd(),"/",filePath,"/packrat")))
  {
    if(length(list.files(paste0(getwd(),"/",filePath,"/packrat"))) == 0)
    {
      errors <- c(errors," packrat directory contains no files")
    } else {"OK"}
    
  } else{errors <- c(errors," No packrat directory found, run bundlePackages()")}     
  
  if(file.exists(paste0(getwd(),"/",filePath,"/README.txt")))
  {
    readme <- scan(paste0(getwd(),"/",filePath,"/README.txt"),what="character",sep="\n")
    if(length(grep("ADD DESCRIPTION",readme)) > 0)
    {
      errors <- c(errors," Some files do not have descriptions in README.txt")
    }
  } else{errors <- c(errors," No README.txt found, run makeReadMe()")}  
  
  if(length(errors) == 0) {
    print("Model archive complete")
  } else(stop(errors))
  
}