# Rearranges data frame to standard R-12 order in preparation for scoring

# Assumes input data frame 'PatientData'

# Question order (as R-12 q nums)
qorder <- c(
1,
2,
3,
6,
7,
8,
9,
10,
11,
8,
12,
6,
7,
9,
10,
11,
1,
4,
5,
12,
4,
5,
2,
3)

# 0 = pre, 1 = post
qtype <- c(1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0)

#Build pre and post data frames
coldf <- 0
length(coldf) <- length(PatientData$Acct)
Qvect <- c("Q1","Q2","Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10","Q11","Q12")
Qarray <- array(0, c(length(coldf), 12))
QDF <- data.frame(Qarray)
names(QDF) <- Qvect

PreDF <- cbind(PatientData$Acct, PatientData$Age, QDF)
names(PreDF) <- c("Acct", "Age", names(QDF))
PostDF <- PreDF

#Get index of 'Q1'
pd_qindex <- match("Q1", names(PatientData))
df_qindex <- match("Q1", names(PreDF))

for (f in 1:(length(qorder))) {
  if (qtype[f] == 0) {
    PreDF[qorder[f]+df_qindex-1] <- PatientData[pd_qindex+f-1]
  }
  else {
    PostDF[qorder[f]+df_qindex-1] <- PatientData[pd_qindex+f-1]
  }
}

#clean up
rm(qtype, qorder, coldf, Qvect, Qarray, QDF, pd_qindex, df_qindex, f)
