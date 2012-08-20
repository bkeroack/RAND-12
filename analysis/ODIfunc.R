#Pull in individual functioning indicators from ODI
#We only care about current

rawdf <- read.csv("../Results/_Results.csv")

pain <- rawdf$os1
persc <- rawdf$os2
lift <- rawdf$os3
walk <- rawdf$os4
sit <- rawdf$os5
stand <- rawdf$os6
slp <- rawdf$os7
#sexlife: see CombindData.R
social <- rawdf$os9
travel <- rawdf$os10

pain[pain == 99] <- NA
persc[persc == 99] <- NA
lift[lift == 99] <- NA
walk[walk == 99] <- NA
sit[sit == 99] <- NA
stand[stand == 99] <- NA
slp[slp == 99] <- NA
social[social == 99] <- NA
travel[travel == 99] <- NA

painf <- ifelse(pain > 2, "SEVERE", "MILDNONE")
perscf <- ifelse(persc > 2, "RESTRICTED", "NORMAL")
liftf <- ifelse(lift > 2, "RESTRICTED", "NORMAL")
walkf <- ifelse(walk > 2, "RESTRICTED", "NORMAL")
sitf <- ifelse(sit > 2, "RESTRICTED", "NORMAL")
standf <- ifelse(stand > 2, "RESTRICTED", "NORMAL")
sleepf <- ifelse(slp > 1, "DISTURBED", "NORMAL")
socialf <- ifelse(social > 2, "RESTRICTED", "NORMAL")
travelf <- ifelse(travel > 2, "RESTRICTED", "NORMAL")

Factors <- data.frame(Factors,
                      PainLevel = factor(painf),
                      PersCare = factor(perscf),
                      LiftFunc = factor(liftf),
                      WalkFunc = factor(walkf),
                      SitFunc = factor(sitf),
                      StandFunc = factor(standf),
                      SleepFunc = factor(sleepf),
                      SocialFunc = factor(socialf),
                      TravelFunc = factor(travelf))
                      
rm(rawdf, pain, persc, lift, walk, sit, stand, slp, social, travel,
painf, perscf, liftf, walkf, sitf, standf, sleepf, socialf, travelf)