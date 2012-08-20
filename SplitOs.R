# Split oswestry data into pre/post frames

# Assumes 'PatientData'

os_index <- match("os1", names(PatientData))

# Copy out oswestry data
OsDF_post <- data.frame(Acct = PatientData$Acct)
names(OsDF_post) <- "Acct"

for (i in 1:10) {
  ques <- data.frame(PatientData[[os_index+i-1]])
  names(ques) <- paste("os", as.character(i), sep = "")
  OsDF_post <- cbind(OsDF_post, ques)
  }

os_index <- os_index + i

OsDF_pre <- data.frame(Acct = PatientData$Acct)
names(OsDF_pre) <- "Acct"

for (i in 1:10) {
  ques <- data.frame(PatientData[[os_index+i-1]])
  names(ques) <- paste("os", as.character(i), sep = "")
  OsDF_pre <- cbind(OsDF_pre, ques)
  }

#clean up
rm(os_index, i, ques)
  