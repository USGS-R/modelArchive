#' Makes a basic readme to go with model archive.
#' 
#' @description
#' The \code{makeReadMe} function generates a basic readme file describing the model and model archive directory structure

#' @param modelTitle String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param modelAuthor String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param modelContact String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param modelDescription String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param modelPurpose String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param modelRunProcedure String describing the model. Line breaks can be included by splitting the description into a character vector, where each line cooresponds to an entry in the vector.
#' @param filePath Relative file path of folder cooresponding to model archive folder.
#'@examples
#'makeReadMe(modelTitle = "example, modelDescription = "This is a test of the emergency broadcast system.")
#'@export
#'
makeReadMe <- function(modelTitle = "",
                       modelAuthor = "",
                       modelContact = "",
                       modelDescription = "",
                       modelPurpose = "",
                       modelRunProcedure = "",
                       supInfo = "",
                       filePath = "modelArchive") {

  systemInfo <- Sys.info()
  rVersion <- paste0(R.Version()$major,".",R.Version()$minor)
  
  readmeFile <- paste0(getwd(),"/",filePath,"/README.txt")
  file.create(readmeFile)
  
  cat("TITLE:",modelTitle, file= readmeFile,sep=" ",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  cat("AUTHOR:",modelAuthor, file= readmeFile,sep=" ",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  cat("CONTACT:",modelContact, file= readmeFile,sep=" ",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  cat("DESCRIPTION", file= readmeFile,sep="\n",append=TRUE)
  cat(modelDescription, file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  cat("PURPOSE", file= readmeFile,sep="\n",append=TRUE)
  cat(modelPurpose, file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  cat("OPERATING SYSTEM:",
      systemInfo[1],
      " ",systemInfo[2],
      " ",systemInfo[3],
      file= readmeFile,append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  cat("R VERSION:",
      rVersion,
      file= readmeFile,append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  cat("MODEL RUN PROCEDURE", file= readmeFile,sep="\n",append=TRUE)
  cat(modelRunProcedure, file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  cat("SUPPLEMENTAL INFORMATION", file= readmeFile,sep="\n",append=TRUE)
  cat(supInfo, file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  cat("DIRECTORY STRUCTURE", file= readmeFile,sep="\n",append=TRUE)
  cat("", file= readmeFile,sep="\n",append=TRUE)
  
  ###Get directory structure
  dirNames <- list.dirs(paste0(getwd(),"/",filePath),full.names=FALSE)
  dirNames <- dirNames[dirNames != "R_files"]
  dirNames <- dirNames[-grep("packrat",dirNames)]
  dirStruc <- list.dirs(paste0(getwd(),"/",filePath))
  dirStruc <- dirStruc[-grep("R_files",dirStruc)]
  dirStruc <- dirStruc[-grep("packrat",dirStruc)]
  
  cat(filePath,file=readmeFile,sep="\n",append=TRUE)
  cat(paste0("   /",dirNames[2:length(dirNames)]),file=readmeFile,sep="\n",append=TRUE)
  cat("   /R_files",file=readmeFile,sep="\n",append=TRUE)
  cat("   /packrat",file=readmeFile,sep="\n",append=TRUE)
  
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