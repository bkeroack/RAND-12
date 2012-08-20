# Load all relevant static data scoring tables

# Data in tables per Ibid., Appendix A & E. 1998. 
# The Psychological Corporation.

#objects need to be global
IRT <- 0
PHC_params <- 0
MHC_params <- 0
GHC_params <- 0
PHC_ints <- 0
MHC_ints <- 0
GHC_ints <- 0

LoadSData <- function() {

IRT <<- read.csv("RAND-12 Key Tables/IRT.csv", header = TRUE, sep = ",")

PHC_params <<- read.csv("RAND-12 Key Tables/Params_PHC.csv", header = TRUE, sep = ",")
MHC_params <<- read.csv("RAND-12 Key Tables/Params_MHC.csv", header = TRUE, sep = ",")
GHC_params <<- read.csv("RAND-12 Key Tables/Params_GHC.csv", header = TRUE, sep = ",")

PHC_ints <<- read.csv("RAND-12 Key Tables/Intercepts_PHC.csv", header = TRUE, sep = ",")
MHC_ints <<- read.csv("RAND-12 Key Tables/Intercepts_MHC.csv", header = TRUE, sep = ",")
GHC_ints <<- read.csv("RAND-12 Key Tables/Intercepts_GHC.csv", header = TRUE, sep = ",")

invisible(TRUE)
}