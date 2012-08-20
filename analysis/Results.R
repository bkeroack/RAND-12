# Read data in prep for analysis

print("ODI, then RAND")
ODI <- read.csv(file.choose())
RAND <- read.csv(file.choose())

Factors <- read.csv("../Results/_Factors.csv")

# clear row numbers
ODI$X <- NULL
RAND$X <- NULL
