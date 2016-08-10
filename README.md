# modelArchive
Package to aid in preparing and reviewing model archives for USGS R models.

#CURRENTLY ONLY SUPPORTS WINDOWS

#Overview
This package was created to help USGS model authors archive models written in R. Special attention must be paid to R model archiving because of variations in R versions and package dependencies. The modelArchive package is a collection of functions that help the model author aggregate all the required files for a complete R model archive.

#Workflow
Create a model archive folder with the required sub directories

```{r, eval=FALSE}
createFolder(folderPath = NULL,
             folderName = "modelArchive")
```

Copy script files into model archive. This function can take specified script file names, or by default copies all scripts in the current working directory

```{r, eval=FALSE}
copyScripts()
```

Get the R version cooresponding to the R version used currently by the model author.

```{r, eval=FALSE}
getR()
```

Get all external package dependencies required by the model and add to the model archive.

```{r, eval=FALSE}
bundlePackages()
```

Make a basic readme file describing the model archive

```{r, eval=FALSE}
makeReadMe(modelDescription = "This is a test of the emergency broadcast system.")
```

Run a basic check on the model archive files and documentation

```{r, eval=FALSE}
checkArchive()
```

Bundle archive to send to review

```{r, eval=FALSE}
bundleArchive()
```

Review an archive recieved

```{r, eval=FALSE}
unbundleArchive(bundle="sharedArchive.tar.gz",where = "myReviewFolder")
```
