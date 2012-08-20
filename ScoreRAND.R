# Score RAND-12 HSI
# (as per _RAND-36 Health Status Inventory_, Appendix E: "Description of the
# RAND-12 Health Status Inventory" (pg 107-114). 1998. The Psychological Corporation.) 


source("LoadSData.R") #Static scoring tables

#Load static scoring tables
LoadSData()

source("IRTFrame.R") #IRT weight
source("GetParamInt.R") #Parameter values and intercepts


#Source data needs to be comma-delimited CSV w/ at the least the following
#named column fields:
# "Acct" (ID number), "Age" (in years), (arb other data), "Q1" through "Q12"

#scoredatafile <- file.choose()
#PatientData <- read.csv(scoredatafile, header = TRUE, sep = ",")


#Fill in IRT weights
q_index <- match("Q1", names(PatientData))
for (i in 1:12) {
  PatientData[[q_index+i-1]] <- mapply(LookupIRT, PatientData[[q_index+i-1]],
                                        MoreArgs=list(question=i))
}

#Partition data into age demographics
PatientData18to24 <- PatientData[PatientData$Age >= 18 & PatientData$Age <= 24, ]
PatientData25to44 <- PatientData[PatientData$Age >= 25 & PatientData$Age <= 44, ]
PatientData45to64 <- PatientData[PatientData$Age >= 45 & PatientData$Age <= 64, ]
PatientData65plus <- PatientData[PatientData$Age >= 65, ]

#Create score data frames
Scores <- 0
length(Scores) <- length(PatientData18to24$Acct)
ScoreFrame18to24 <- data.frame(Acct=Scores, PHC=Scores, MHC=Scores, GHC=Scores)
length(Scores) <- length(PatientData25to44$Acct)
ScoreFrame25to44 <- data.frame(Acct=Scores, PHC=Scores, MHC=Scores, GHC=Scores)
length(Scores) <- length(PatientData45to64$Acct)
ScoreFrame45to64 <- data.frame(Acct=Scores, PHC=Scores, MHC=Scores, GHC=Scores)
length(Scores) <- length(PatientData65plus$Acct)
ScoreFrame65plus <- data.frame(Acct=Scores, PHC=Scores, MHC=Scores, GHC=Scores)

#Calculate composites

	demo <- 18
	comp <- "PHC"
	ScoreFrame18to24$Acct <- PatientData18to24$Acct
	ScoreFrame18to24$PHC <- GetIntercept(comp, demo) +
			(PatientData18to24$Q1*(GetParam(1, comp, demo))) +
			(PatientData18to24$Q2*(GetParam(2, comp, demo))) +
			(PatientData18to24$Q3*(GetParam(3, comp, demo))) +
			(PatientData18to24$Q4*(GetParam(4, comp, demo))) +
			(PatientData18to24$Q5*(GetParam(5, comp, demo))) +
			(PatientData18to24$Q8*(GetParam(6, comp, demo)))

	comp <- "MHC"
	ScoreFrame18to24$MHC <- GetIntercept(comp, demo) +
			(PatientData18to24$Q6*(GetParam(1, comp, demo))) +
			(PatientData18to24$Q7*(GetParam(2, comp, demo))) +
			(PatientData18to24$Q9*(GetParam(3, comp, demo))) +
			(PatientData18to24$Q10*(GetParam(4, comp, demo))) +
			(PatientData18to24$Q11*(GetParam(5, comp, demo))) +
			(PatientData18to24$Q12*(GetParam(6, comp, demo)))

	comp <- "GHC"
	ScoreFrame18to24$GHC <- GetIntercept(comp, demo) +
			(PatientData18to24$Q1*(GetParam(1, comp, demo))) +
			(PatientData18to24$Q2*(GetParam(2, comp, demo))) +
			(PatientData18to24$Q3*(GetParam(3, comp, demo))) +
			(PatientData18to24$Q4*(GetParam(4, comp, demo))) +
			(PatientData18to24$Q5*(GetParam(5, comp, demo))) +
			(PatientData18to24$Q6*(GetParam(6, comp, demo))) +
			(PatientData18to24$Q7*(GetParam(7, comp, demo))) +
			(PatientData18to24$Q8*(GetParam(8, comp, demo))) +
			(PatientData18to24$Q9*(GetParam(9, comp, demo))) +
			(PatientData18to24$Q10*(GetParam(10, comp, demo))) +
			(PatientData18to24$Q11*(GetParam(11, comp, demo))) +
			(PatientData18to24$Q12*(GetParam(12, comp, demo)))

	demo <- 25
	comp <- "PHC"
	ScoreFrame25to44$Acct <- PatientData25to44$Acct
	ScoreFrame25to44$PHC <- GetIntercept(comp, demo) +
			(PatientData25to44$Q1*(GetParam(1, comp, demo))) +
			(PatientData25to44$Q2*(GetParam(2, comp, demo))) +
			(PatientData25to44$Q3*(GetParam(3, comp, demo))) +
			(PatientData25to44$Q4*(GetParam(4, comp, demo))) +
			(PatientData25to44$Q5*(GetParam(5, comp, demo))) +
			(PatientData25to44$Q8*(GetParam(6, comp, demo)))

	comp <- "MHC"
	ScoreFrame25to44$MHC <- GetIntercept(comp, demo) +
			(PatientData25to44$Q6*(GetParam(1, comp, demo))) +
			(PatientData25to44$Q7*(GetParam(2, comp, demo))) +
			(PatientData25to44$Q9*(GetParam(3, comp, demo))) +
			(PatientData25to44$Q10*(GetParam(4, comp, demo))) +
			(PatientData25to44$Q11*(GetParam(5, comp, demo))) +
			(PatientData25to44$Q12*(GetParam(6, comp, demo)))

	comp <- "GHC"
	ScoreFrame25to44$GHC <- GetIntercept(comp, demo) +
			(PatientData25to44$Q1*(GetParam(1, comp, demo))) +
			(PatientData25to44$Q2*(GetParam(2, comp, demo))) +
			(PatientData25to44$Q3*(GetParam(3, comp, demo))) +
			(PatientData25to44$Q4*(GetParam(4, comp, demo))) +
			(PatientData25to44$Q5*(GetParam(5, comp, demo))) +
			(PatientData25to44$Q6*(GetParam(6, comp, demo))) +
			(PatientData25to44$Q7*(GetParam(7, comp, demo))) +
			(PatientData25to44$Q8*(GetParam(8, comp, demo))) +
			(PatientData25to44$Q9*(GetParam(9, comp, demo))) +
			(PatientData25to44$Q10*(GetParam(10, comp, demo))) +
			(PatientData25to44$Q11*(GetParam(11, comp, demo))) +
			(PatientData25to44$Q12*(GetParam(12, comp, demo)))

	demo <- 45
	comp <- "PHC"
	ScoreFrame45to64$Acct <- PatientData45to64$Acct
	ScoreFrame45to64$PHC <- GetIntercept(comp, demo) +
			(PatientData45to64$Q1*(GetParam(1, comp, demo))) +
			(PatientData45to64$Q2*(GetParam(2, comp, demo))) +
			(PatientData45to64$Q3*(GetParam(3, comp, demo))) +
			(PatientData45to64$Q4*(GetParam(4, comp, demo))) +
			(PatientData45to64$Q5*(GetParam(5, comp, demo))) +
			(PatientData45to64$Q8*(GetParam(6, comp, demo)))

	comp <- "MHC"
	ScoreFrame45to64$MHC <- GetIntercept(comp, demo) +
			(PatientData45to64$Q6*(GetParam(1, comp, demo))) +
			(PatientData45to64$Q7*(GetParam(2, comp, demo))) +
			(PatientData45to64$Q9*(GetParam(3, comp, demo))) +
			(PatientData45to64$Q10*(GetParam(4, comp, demo))) +
			(PatientData45to64$Q11*(GetParam(5, comp, demo))) +
			(PatientData45to64$Q12*(GetParam(6, comp, demo)))

	comp <- "GHC"
	ScoreFrame45to64$GHC <- GetIntercept(comp, demo) +
			(PatientData45to64$Q1*(GetParam(1, comp, demo))) +
			(PatientData45to64$Q2*(GetParam(2, comp, demo))) +
			(PatientData45to64$Q3*(GetParam(3, comp, demo))) +
			(PatientData45to64$Q4*(GetParam(4, comp, demo))) +
			(PatientData45to64$Q5*(GetParam(5, comp, demo))) +
			(PatientData45to64$Q6*(GetParam(6, comp, demo))) +
			(PatientData45to64$Q7*(GetParam(7, comp, demo))) +
			(PatientData45to64$Q8*(GetParam(8, comp, demo))) +
			(PatientData45to64$Q9*(GetParam(9, comp, demo))) +
			(PatientData45to64$Q10*(GetParam(10, comp, demo))) +
			(PatientData45to64$Q11*(GetParam(11, comp, demo))) +
			(PatientData45to64$Q12*(GetParam(12, comp, demo)))

	demo <- 65
	comp <- "PHC"
	ScoreFrame65plus$Acct <- PatientData65plus$Acct
	ScoreFrame65plus$PHC <- GetIntercept(comp, demo) +
			(PatientData65plus$Q1*(GetParam(1, comp, demo))) +
			(PatientData65plus$Q2*(GetParam(2, comp, demo))) +
			(PatientData65plus$Q3*(GetParam(3, comp, demo))) +
			(PatientData65plus$Q4*(GetParam(4, comp, demo))) +
			(PatientData65plus$Q5*(GetParam(5, comp, demo))) +
			(PatientData65plus$Q8*(GetParam(6, comp, demo)))

	comp <- "MHC"
	ScoreFrame65plus$MHC <- GetIntercept(comp, demo) +
			(PatientData65plus$Q6*(GetParam(1, comp, demo))) +
			(PatientData65plus$Q7*(GetParam(2, comp, demo))) +
			(PatientData65plus$Q9*(GetParam(3, comp, demo))) +
			(PatientData65plus$Q10*(GetParam(4, comp, demo))) +
			(PatientData65plus$Q11*(GetParam(5, comp, demo))) +
			(PatientData65plus$Q12*(GetParam(6, comp, demo)))

	comp <- "GHC"
	ScoreFrame65plus$GHC <- GetIntercept(comp, demo) +
			(PatientData65plus$Q1*(GetParam(1, comp, demo))) +
			(PatientData65plus$Q2*(GetParam(2, comp, demo))) +
			(PatientData65plus$Q3*(GetParam(3, comp, demo))) +
			(PatientData65plus$Q4*(GetParam(4, comp, demo))) +
			(PatientData65plus$Q5*(GetParam(5, comp, demo))) +
			(PatientData65plus$Q6*(GetParam(6, comp, demo))) +
			(PatientData65plus$Q7*(GetParam(7, comp, demo))) +
			(PatientData65plus$Q8*(GetParam(8, comp, demo))) +
			(PatientData65plus$Q9*(GetParam(9, comp, demo))) +
			(PatientData65plus$Q10*(GetParam(10, comp, demo))) +
			(PatientData65plus$Q11*(GetParam(11, comp, demo))) +
			(PatientData65plus$Q12*(GetParam(12, comp, demo)))

#If there are any add'l columns b/w acctnum/age and q data,
#copy them to scoring frames unchanged
#if (q_index > 3) {
#  for (i_new in 3:(q_index-1)) {
#    ScoreFrame18to24 <- cbind(ScoreFrame18to24, PatientData18to24[[i_new]])
#   ScoreFrame25to44 <- cbind(ScoreFrame25to44, PatientData25to44[[i_new]])
#    ScoreFrame45to64 <- cbind(ScoreFrame45to64, PatientData45to64[[i_new]])
#    ScoreFrame65plus <- cbind(ScoreFrame65plus, PatientData65plus[[i_new]])
#  }
#}

# Concatenate the demo scores into final data frame
# This will be in demographic order
ScoreFrame <- rbind(ScoreFrame18to24, ScoreFrame25to44, ScoreFrame45to64, ScoreFrame65plus)

# Round to nearest integer
ScoreFrame[2:4] <- round(ScoreFrame[2:4])

#Write to csv
#Comment out if you need to process final data frame further
#csvfilename <- paste(scoredatafile, "_ScoreFrame.csv", sep="")

#write.csv(ScoreFrame, file = csvfilename)

#clean up
#vars
rm(PatientData18to24, PatientData25to44, PatientData45to64, PatientData65plus,
   ScoreFrame18to24, ScoreFrame25to44, ScoreFrame45to64, ScoreFrame65plus,
   comp, demo, Scores, i, q_index, IRT, PHC_params, MHC_params, GHC_params,
   PHC_ints, MHC_ints, GHC_ints, IRT_DF)
#rm(i_new)
#funcs
rm(GetIntercept, GetParam, LoadSData, LookupIRT)
   
#END


