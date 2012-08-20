# Merge factors into results dataframes

dsize <- length(ODI$Acct)

smoking2 <- smoking <- rep("b", dsize)

for (i in 1:dsize) {
  smoking[i] <- as.character(Factors$Smoking[Factors$Acct == ODI$Acct[i]])
  smoking2[i] <- as.character(Factors$Smoking[Factors$Acct == RAND$Acct[i]])
  }

alcohol2 <- alcohol <- rep("b", dsize)

for (i in 1:dsize) {
  alcohol[i] <- as.character(Factors$Alcohol[Factors$Acct == ODI$Acct[i]])
  alcohol2[i] <- as.character(Factors$Alcohol[Factors$Acct == RAND$Acct[i]])
  }

drugs2 <- drugs <- rep("b", dsize)

for (i in 1:dsize) {
  drugs[i] <- as.character(Factors$Drugs[Factors$Acct == ODI$Acct[i]])
  drugs2[i] <- as.character(Factors$Drugs[Factors$Acct == RAND$Acct[i]])
  }

employed2 <- employed <- rep("b", dsize)

for (i in 1:dsize) {
  employed[i] <- as.character(Factors$Employed[Factors$Acct == ODI$Acct[i]])
  employed2[i] <- as.character(Factors$Employed[Factors$Acct == RAND$Acct[i]])
  }

workstop2 <- workstop <- rep("b", dsize)

for (i in 1:dsize) {
  workstop[i] <- as.character(Factors$WorkStop[Factors$Acct == ODI$Acct[i]])
  workstop2[i] <- as.character(Factors$WorkStop[Factors$Acct == RAND$Acct[i]])
  }

returnw2 <- returnw <- rep("b", dsize)

for (i in 1:dsize) {
  returnw[i] <- as.character(Factors$ReturnW[Factors$Acct == ODI$Acct[i]])
  returnw2[i] <- as.character(Factors$ReturnW[Factors$Acct == RAND$Acct[i]])
  }

narcuse2 <- narcuse <- rep("b", dsize)

for (i in 1:dsize) {
  narcuse[i] <- as.character(Factors$NarcUse[Factors$Acct == ODI$Acct[i]])
  narcuse2[i] <- as.character(Factors$NarcUse[Factors$Acct == RAND$Acct[i]])
  }

# Ignoring narctype for now

exercise2 <- exercise <- rep("b", dsize)

for (i in 1:dsize) {
  exercise[i] <- as.character(Factors$Exercise[Factors$Acct == ODI$Acct[i]])
  exercise2[i] <- as.character(Factors$Exercise[Factors$Acct == RAND$Acct[i]])
  }

exercisepre2 <- exercisepre <- rep("b", dsize)

for (i in 1:dsize) {
  exercisepre[i] <- as.character(Factors$ExercisePre[Factors$Acct == ODI$Acct[i]])
  exercisepre2[i] <- as.character(Factors$ExercisePre[Factors$Acct == RAND$Acct[i]])
  }

physsatis2 <- physsatis <- rep("b", dsize)

for (i in 1:dsize) {
  physsatis[i] <- as.character(Factors$PhysSatis[Factors$Acct == ODI$Acct[i]])
  physsatis2[i] <- as.character(Factors$PhysSatis[Factors$Acct == RAND$Acct[i]])
  }
  
bmi_v2 <- bmi_v <- rep(0, dsize)

for (i in 1:dsize) {
  bmi_v[i] <- Factors$BMI[Factors$Acct == ODI$Acct[i]]
  bmi_v2[i] <- Factors$BMI[Factors$Acct == RAND$Acct[i]]
  }

ODI <- data.frame(
  Smoking = smoking,
  Alcohol = alcohol,
  Drugs = drugs,
  Employed = employed,
  WorkStop = workstop,
  ReturnW = returnw,
  NarcUse = narcuse,
#narctype
  Exercise = exercise,
  ExercisePre = exercisepre,
  PhysSatis = physsatis,
  BMI = bmi_v,
  ODI)

RAND <- data.frame(
  Smoking = smoking2,
  Alcohol = alcohol2,
  Drugs = drugs2,
  Employed = employed2,
  WorkStop = workstop2,
  ReturnW = returnw2,
  NarcUse = narcuse2,
#narctype
  Exercise = exercise2,
  ExercisePre = exercisepre2,
  PhysSatis = physsatis2,
  BMI = bmi_v2,
  RAND)
  
#cleanup
rm(dsize, i)
rm(
 smoking,
 alcohol,
 drugs,
 employed,
 workstop,
 returnw,
 narcuse,
#narctype
 exercise,
 exercisepre,
 physsatis,
 bmi_v,
 smoking2,
 alcohol2,
 drugs2,
 employed2,
 workstop2,
 returnw2,
 narcuse2,
#narctype2
 exercise2,
 exercisepre2,
 physsatis2,
 bmi_v2)
