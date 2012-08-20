# Script to automatically score all data

# FILE NAMES/PATHS

ResultPath = "../Results/"
RawDataFile = "_Results.csv"
ODIName = "__ODI_"
RANDName = "__RAND_"

res_fname <- paste(ResultPath, RawDataFile, sep = "") 

PatientData <- read.csv(res_fname)
rm(res_fname)

source("Reorder.R")

RawPD <- PatientData

PatientData <- PreDF

print("Scoring RAND-12")

  source("ScoreRAND.R")

  PreRAND <- ScoreFrame
  rm(ScoreFrame)

  PatientData <- PostDF
  
  source("ScoreRAND.R")
  
  PostRAND <- ScoreFrame
  rm(ScoreFrame)
  
  RANDScores <- data.frame(Acct = PreRAND$Acct)
  RANDScores <- cbind(RANDScores, PrePHC = PreRAND$PHC, PreMHC = PreRAND$MHC,
                      PreGHC = PreRAND$GHC, PostPHC = PostRAND$PHC,
                      PostMHC = PostRAND$MHC, PostGHC = PostRAND$GHC)
  
  RANDDiff <- data.frame(DiffPHC = (PostRAND$PHC - PreRAND$PHC),
                          DiffMHC = (PostRAND$MHC - PreRAND$MHC),
                          DiffGHC = (PostRAND$GHC - PreRAND$GHC))

  RAND <- cbind(RANDScores, RANDDiff)
  rm(RANDScores, RANDDiff, PostRAND, PreRAND, PostDF, PreDF)
  
print("Scoring Oswestry")

  PatientData <- RawPD
  
  source("SplitOs.R")
  
  PatientData <- OsDF_pre
  
  source("Oswestry.R")
  
  PreOsw <- OswestryScore
  rm(OswestryScore)
  
  PatientData <- OsDF_post
  
  source("Oswestry.R")
  
  PostOsw <- OswestryScore
  rm(OswestryScore, OsDF_pre, OsDF_post)
  
  ODI <- data.frame(Acct = PreOsw$Acct,
                    PreODI = PreOsw$Score,
                    PostODI = PostOsw$Score,
                    DiffODI = (PostOsw$Score - PreOsw$Score))
                    
  # When difference is <10, replace pre/post w/ avg of both
  # resulting diff = 0
  ODI$PreODI[abs(ODI$DiffODI) < 10] <- (ODI$PreODI[abs(ODI$DiffODI) < 10] +
                                        ODI$PostODI[abs(ODI$DiffODI) < 10])/2
  ODI$PostODI[abs(ODI$DiffODI) < 10] <- ODI$PreODI[abs(ODI$DiffODI) < 10]
  ODI$DiffODI[abs(ODI$DiffODI) < 10] <- 0

  rm(PreOsw, PostOsw)
  
print("Writing CSV")
                      
  res_fname <- paste(ResultPath, RANDName, Sys.Date(), ".csv", sep = "")
  write.csv(RAND, res_fname)
  
  res_fname <- paste(ResultPath, ODIName, Sys.Date(), ".csv", sep = "")
  write.csv(ODI, res_fname)
  
  rm(res_fname)
  rm(ODIName, RANDName, RawDataFile, ResultPath)
  rm(ODI, RAND, RawPD, PatientData)
  
  
  


