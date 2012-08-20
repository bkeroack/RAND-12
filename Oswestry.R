# Score Oswestry

# Assumes data frame 'PatientData' with score data


os_index <- match("os1", names(PatientData))

# Copy out oswestry data
OsDF <- data.frame(rep(0, length(PatientData$Acct)))
names(OsDF) <- "Acct"

for (i in 1:10) {
  ques <- PatientData[(os_index+i-1)]
  names(ques) <- paste("os", as.character(i), sep = "")
  OsDF <- cbind(OsDF, ques)
  }

# Change all 99 (blank values) to NA
OsDF[OsDF == 99] <- NA

cblank <- rep(0, length(PatientData$Acct))
OsScoreFrame <- data.frame(Acct = PatientData$Acct, Sum = cblank, Denom = cblank, Score = cblank)

tmat <- data.matrix(OsDF)
OsScoreFrame$Sum <- rowSums(tmat, na.rm = TRUE)
tmat[tmat >= 0] <- 1
tmat[is.na(tmat)] <- 0
OsScoreFrame$Denom <- rowSums(tmat)
OsScoreFrame$Score <- (OsScoreFrame$Sum/(OsScoreFrame$Denom * 5)) * 100
OswestryScore <- data.frame(Acct = OsScoreFrame$Acct, Score = round(OsScoreFrame$Score))

#clean up
rm(os_index, cblank, OsDF, i, ques, tmat, OsScoreFrame)
