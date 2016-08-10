#' Makes a basic readme to go with model archive.
#' 
#' @description
#' The \code{makeReadMe} function generates a basic readme file describing the model and model archive directory structure

#' @param modelDescription String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param filePath Relative file path of folder cooresponding to model archive folder.
#'@examples
#'makeReadMe()
#'@export
#'
makeReadMe <- function(modelDescription,filePath = "modelArchive") {

  readmeFile <- paste0(getwd(),"/",filePath,"/README.txt")
  file.create(readmeFile)
  cat(modelDescription, file= readmeFile,sep="\n",append=TRUE)
  
  cat("", file= readmeFile,sep="\n",append=TRUE)
  cat("Directory Structure", file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  ###Get directory structure
  dirNames <- list.dirs(paste0(getwd(),"/",filePath),full.names=FALSE)
  dirNames <- dirNames[dirNames != "R_files"]
  dirNames <- dirNames[-grep("packrat",dirNames)]
  dirStruc <- list.dirs(filePath)
  dirStruc <- dirStruc[dirStruc != "R_files"]
  dirStruc <- dirStruc[-grep("packrat",dirStruc)]
  
  cat(filePath,file=readmeFile,sep="\n",append=TRUE)
  cat(paste0("   /",dirNames[2:length(dirNames)]),file=readmeFile,sep="\n",append=TRUE)
  
  cat("", file= readmeFile,sep="\n",append=TRUE)
  ###Describe each directory
  for(i in 2:length(dirNames))
  {
    cat(paste0("/",dirNames[i])," contains the following files:",file=readmeFile,sep="\n",append=TRUE)
    cat(paste0("   /",list.files(dirStruc[i])," ADD DESCRIPTION"),file=readmeFile,sep="\n",append=TRUE)
    cat("", file= readmeFile,sep="\n",append=TRUE)
  }
  
  cat("/R_files"," contains files to install R version used for model",file=readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  cat("/packrat"," contains packages used by model that are not part of the base R library",file=readmeFile,sep="\n",append=TRUE)
  

}