# Pull in basic factor info from study population

Population <- read.csv("../Population.csv")


#RAND
dsize <- length(RAND$Acct)

ages <- rep(0, dsize)

for (i in 1:dsize) {
  ages[i] <- Population$Age[Population$Acct == RAND$Acct[i]]
  }

doctor <- rep(0, dsize)

for (i in 1:dsize) {
  doctor[i] <- Population$Doctor[Population$Acct == RAND$Acct[i]]
  }

sex <- rep("b", dsize)

for (i in 1:dsize) {
  sex[i] <- as.character(Population$Sex[Population$Acct == RAND$Acct[i]])
  }
  
p_info <- data.frame(Age = ages, Sex = sex, Doctor = doctor)

RAND <- cbind(p_info, RAND)

rm(p_info, ages, doctor, sex, i, dsize)

# Substitute doc numbers
RAND$Doctor[RAND$Doctor == 1] <- "scheid"
RAND$Doctor[RAND$Doctor == 11] <- "bahn"
RAND$Doctor[RAND$Doctor == 27] <- "noce"

# They have to be factors
# this prob shouldn't be done like this
RAND$Doctor <- factor(RAND$Doctor)

#cleanup
rm(Population)


