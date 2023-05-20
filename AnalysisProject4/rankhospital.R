rankhospital <- function(state,outcome, num = "best"){
    
    # Read in the data
    
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    outcome_data[,11] <- as.numeric(outcome_data[,11])
    outcome_data[,17] <- as.numeric(outcome_data[,17])
    outcome_data[,23] <- as.numeric(outcome_data[,23])
    
    abv_states <- outcome_data$State
    outcome_name <- c("heart attack","heart failure", "pneumonia")
    
    # Depending on the value of the 'outcome' parameter, set the 'index' variable to the
    # 11th, 17th, or 23rd column of the 'outcome_data' dataframe,
    # and set the 'x' variable to the corresponding column number
    
    if (outcome == "heart attack"){
        index <- outcome_data[,11]
        x <- 11
    }
    if (outcome == "heart failure"){
        index <- outcome_data[,17]
        x <- 17
    }
    if (outcome == "pneumonia"){
        index <- outcome_data[,23]
        x <- 23
    }
    
    if (num == "best"){
        num <- 1
    }
    
    
    if (state %in% abv_states){
        
        if (outcome %in% outcome_name){
            
            state_outcome_filter <- outcome_data[which(outcome_data$State == state & !is.na(index)),]
            ordered_outcome <- state_outcome_filter[order(state_outcome_filter[,x],state_outcome_filter$Hospital.Name),]
            
            if (num == "worst"){
                num <- length(state_outcome_filter[,x])
            }
            
            if (num <= length(state_outcome_filter$Hospital.Name) ){
                return(ordered_outcome$Hospital.Name[num])
            }
            else{return("NA")}
        }
        else{stop("invalid outcome")}
        
    }
    else{stop("invalid state")}
    
    
}