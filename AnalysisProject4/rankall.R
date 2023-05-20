rankall <- function(outcome, num = "best"){
    
    outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    # Convert relevant columns to numeric
    outcome_data[,11] <- as.numeric(outcome_data[,11])
    outcome_data[,17] <- as.numeric(outcome_data[,17])
    outcome_data[,23] <- as.numeric(outcome_data[,23])
    
    
    # Define valid outcomes
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    # Check if outcome is valid
    if (!(outcome %in% valid_outcomes)) {
        stop("invalid outcome")
    }
    
    
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
    
    
    # Get all states in the data in alphabetical order
    all_states            <- unique(outcome_data$State)
    sorted_states_indices <- order(all_states)
    all_states            <- all_states[sorted_states_indices]
    
    
    
    # Initialize vectors to store hospital and state names
    hospitals <- c()
    state_nme <- c()
    
    
    # Loop through each state
    for (state in all_states) {
        
        state_data <- outcome_data[which(outcome_data$State == state & !is.na(index)), ]
        state_data <- state_data[order(state_data[,x], state_data$Hospital.Name), ]
        
        # Get the "num" rank of hospital
        if (num == "best") {
            num <- 1
        } else if (num == "worst") {
            num <- length(state_data[,x])
        } else {
            num <- num
        }
        
        
        hospitals  <- append(hospitals , state_data$Hospital.Name[num])
        state_nme  <- append(state_nme , state)
        
    }
    
    # Create data frame with hospital names and state abbreviations
    df <- data.frame(hospital = hospitals, state = state_nme)
    return(df)
    
}