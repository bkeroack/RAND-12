# Script to generate weighted IRT score

# Assumes 'IRT' data frame with weights vs resps

# usage
# GetIRTScore(question_num, response)

IRT_Response <- 0
IRT_Weights <- 0
IRT_Score_Array <- 0

GetIRTScore <- function(question, response) {

# Going from char vect "xx;xx;xx" -> integer vect 'xx' 'xx' 'xx'
# Prob don't need to coerce it twice tho

IRT_Response <- as.integer(unlist(strsplit(as.character(IRT$Response[[question]]), ";")))
IRT_Weights <- as.integer(unlist(strsplit(as.character(IRT$IRT[[question]]), ";")))

IRT_Score_Array <- array(c(IRT_Response, IRT_Weights), c(length(IRT_Response),2))

IRT_Score_Array[response,2]
}