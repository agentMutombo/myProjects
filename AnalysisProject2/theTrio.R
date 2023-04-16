## In this file there are three functions that are meant to interact with a dataset.
## The dataset is contained in a zip file specdata.zip 
## that you can access in the repository


## pollutantmean function calculates the mean of a pollutant (sulfate or nitrate)
## across a specified list of monitors.  'pollutantmean' takes three arguments:
## 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers,
## 'pollutantmean' reads that monitors' particulate matter data from the
## directory specified in the 'directory' argument and returns
## the mean of the pollutant across all of the monitors, 
## ignoring any missing values coded as NA.

pollutantmean <- function(directory, pollutant, id = 1:322){
    
    files <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    
    for (x in id){
        dat <- rbind(dat, read.csv(files[x]))
    }
    
    mean(dat[[pollutant]], na.rm = TRUE)
    
}


## "complete" reads a directory full of files and reports the number of completely observed
## cases in each data file. "complete" returns a data frame where the first column
## is the name of the file and the second column is
## the number of complete cases.

complete <- function(directory, id =1:322){
    
    files <- list.files(directory, full.names = TRUE)
    ccases <- data.frame()
    
    for (x in id){
        data <- read.csv(files[x])
        ccases <- rbind(ccases, c(x, sum(complete.cases(data))))
    }
    colnames(ccases) <- c("id", "nobs")
    ccases
}



## "corr" function takes a directory of data files and a threshold for complete cases and 
## the correlation between sulfate and nitrate for monitor locations where the number of
## completely observed cases (on all variables) is greater than the threshold.
## "corr" returns a vector of correlations for the monitors that meet the 
## threshold requirement. If no monitors meet the threshold requirement,
## then "corr" returns a numeric vector of length 0

corr <- function(directory, threshold = 0){
    
    comcases <- complete("specdata")
    comcases <- comcases[which(comcases$nobs > threshold),]
    files <- list.files(directory, full.names = TRUE)
    corvector <- numeric(0)
    
    for (id in comcases$id){
        mdata <- read.csv(files[id])
        corvector <- c(corvector, cor(mdata$sulfate,mdata$nitrate, use = "pairwise.complete.obs"))
    }
    
    corvector
}
