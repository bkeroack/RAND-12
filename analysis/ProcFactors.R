# Process extended factors
# Requires dataframe 'Factors'

#Change all text 'N/A' into real NAs
for (i in 1:length(names(Factors))) {
  Factors[[i]][Factors[[i]] == "N/A"] <- NA
  }
rm(i)

#Convert numeric levels to text labels in desired columns
levels(Factors$Alcohol) <- car::recode(levels(Factors$Alcohol),
                                  "0='NONE';1='OCC';2='WEEKLY';3='DAILY'",
                                  as.factor.result = TRUE)

levels(Factors$Drugs) <- car::recode(levels(Factors$Drugs), "0='NONE';1='OPIATE';
                                2='STIMULANT';3='DEPRESSANT';4='MARIJUANA';
                                5='HALLUCINOGEN';6='OTHER'")

Factors$NarcUse <- factor(Factors$NarcUse)
levels(Factors$NarcUse) <- car::recode(levels(Factors$NarcUse), "0='NONE';1='OCC/PRN';
                                  2='DAILY'")

#leaving narc type alone for now
#levels(Factors$NarcType)

Factors$OldNarcUse <- factor(Factors$OldNarcUse)
levels(Factors$OldNarcUse) <- car::recode(levels(Factors$OldNarcUse), "0='NONE';
                                      1='OCC/PRN';2='DAILY'")

Factors$Diag <- factor(Factors$Diag)
levels(Factors$Diag) <- car::recode(levels(Factors$Diag), "1='STENOSIS';2='SPONDYLOLISTHESIS';
                                3='HERNIATION';4='GENERAL/DDD';5='OTHER';NA=NA")

Factors$YearSurg <- factor(Factors$YearSurg)

#Generate BMI

#defactor
weight <- as.numeric(as.character(Factors$Weight))
weight[is.na(weight)] <- 0
Factors$Weight <- weight; rm(weight)
height <- as.numeric(as.character(Factors$Height))
height[is.na(height)] <- 1
Factors$Height <- height; rm(height)

BMI_v <- round((Factors$Weight * 703)/(Factors$Height^2), digits = 1)

BMI_v[BMI_v == 0] <- NA

Factors <- data.frame(Factors, BMI = BMI_v); rm(BMI_v)

# Convert Employed and Alcohol factors into simple Yes/No
#working <- ifelse(Factors$Employed == "YES" | 
#                 (Factors$Employed == "RETIRED" & Factors$Age >= 60),
#                  "YES", "NO")

#Factors <- data.frame(Factors, Working = working); rm(working)


drink <- ifelse(Factors$Alcohol == "NONE", "NO", "YES")
Factors <- data.frame(Factors, Drink = drink); rm(drink)




