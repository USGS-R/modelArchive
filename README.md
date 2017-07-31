# modelArchive
Package to aid in preparing and reviewing model archives for USGS R models.

## Package Status
[![status](https://img.shields.io/badge/USGS-Orphan-red.svg)](https://owi.usgs.gov/R/packages.html#orphan)

This package is currently in an 'orphaned' state, and
looking for a new maintainer. For more information, see:
[https://owi.usgs.gov/R/packages.html#orphan](https://owi.usgs.gov/R/packages.html#orphan)

If you are interested in becoming the official maintainer of `modelArchive`, please email gs-w_r_admin@usgs.gov.

In the meantime, we rely on community involvement to report and fix bugs.

### Current build tests:

|Linux|Test Coverage|
|----------|------------|
| [![travis](https://travis-ci.org/USGS-R/modelArchive.svg?branch=master)](https://travis-ci.org/USGS-R/modelArchive)|[![Coverage Status](https://coveralls.io/repos/github/USGS-R/modelArchive/badge.svg?branch=master)](https://coveralls.io/github/USGS-R/modelArchive?branch=master)|


### Reporting bugs

Please consider reporting bugs and asking questions on the Issues page:
[https://github.com/USGS-R/modelArchive/issues](https://github.com/USGS-R/modelArchive/issues)

Follow `@USGS_R` on Twitter for updates on USGS R packages:

[![Twitter Follow](https://img.shields.io/twitter/follow/USGS_R.svg?style=social&label=Follow%20USGS_R)](https://twitter.com/USGS_R)


## Code of Conduct

We want to encourage a warm, welcoming, and safe environment for contributing to this project. See the [code of conduct](https://github.com/USGS-R/modelArchive/blob/master/CONDUCT.md) for more information.

# CURRENTLY ONLY SUPPORTS WINDOWS

# Overview
This package was created to help USGS model authors archive models written in R. Special attention must be paid to R model archiving because of variations in R versions and package dependencies. The modelArchive package is a collection of functions that help the model author aggregate all the required files for a complete R model archive.

# Workflow
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

Make a basic .meta metadata file describing each dataframe used in the model

```{r, eval=FALSE}
dataDoc(dataFrame = dataset1,fileName = "dataset1.meta")
dataDoc(dataFrame = dataset2,fileName = "dataset2.meta")
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

## Disclaimer

This software is in the public domain because it contains materials that originally came from the U.S. Geological Survey, an agency of the United States Department of Interior. For more information, see the official USGS copyright policy at [https://www.usgs.gov/visual-id/credit_usgs.html#copyright](https://www.usgs.gov/visual-id/credit_usgs.html#copyright)

Although this software program has been used by the U.S. Geological Survey (USGS), no warranty, expressed or implied, is made by the USGS or the U.S. Government as to the accuracy and functioning of the program and related program material nor shall the fact of distribution constitute any such warranty, and no responsibility is assumed by the USGS in connection therewith.

This software is provided "AS IS."




