# Partition data
attach(CSData)
posdf <- CSData[ImpIndex >= 5,]
negdf <- CSData[ImpIndex < 5,]

write.csv(posdf, paste("../Results/___pos-", Sys.Date(), ".csv", sep=""))
write.csv(negdf, paste("../Results/___neg-", Sys.Date(), ".csv", sep=""))
write.csv(CSData, paste("../Results/___CSData-", Sys.Date(), ".csv", sep=""))

detach(CSData)










#=================================OLD STUFF BELOW===============================
#CSData.ghc <- CSData[DiffGHC > 0,]
#CSData.ghcnull <- CSData[DiffGHC <= 0,]
#write.csv(CSData.ghc, paste("../Results/___CSData.ghc-", Sys.Date(), ".csv", sep=""))
#write.csv(CSData.ghcnull, paste("../Results/___CSData.ghcnull-", Sys.Date(), ".csv", sep=""))
#
#
#
## Read partitioned data
#CSData.ghc <- read.csv(file.choose())
#CSData.ghcnull <- read.csv(file.choose())
#CSData.phc <- read.csv(file.choose())
#CSData.phcnull <- read.csv(file.choose())
#CSData.odi <- read.csv(file.choose())
#CSData.odinull <- read.csv(file.choose())
#
#CSData.ghc$X <- NULL
#CSData.ghcnull$X <- NULL
#CSData.phc$X <- NULL
#CSData.phcnull$X <- NULL
#CSData.odi$X <- NULL
#CSData.odinull$X <- NULL
#CSData.ghc$X.1 <- NULL
#CSData.ghcnull$X.1 <- NULL
#CSData.phc$X.1 <- NULL
#CSData.phcnull$X.1 <- NULL
#CSData.odi$X.1 <- NULL
#CSData.odinull$X.1 <- NULL
#
## Look for significance
#
## column indexes of relevant factors
#findex <- c(1:2, 4, 6, 8:15, 17:19)
#
#fdf_ghcnull <- CSData.ghcnull[findex]
#fdf_ghc <- CSData.ghc[findex]
#fdf_phcnull <- CSData.phcnull[findex]
#fdf_phc <- CSData.phc[findex]
#fdf_odinull <- CSData.odinull[findex]
#fdf_odi <- CSData.odi[findex]
#
#
#for (i in 1:length(names(fdf_ghc))) {
#  ctab <- rbind(table(fdf_ghc[[1]]), table(fdf_ghcnull[[1]]))
#  ftest <- fisher.test(ctab)
#  if (ftest$p.value < 0.05) {
#    print(names(fdf_ghc[i]))
#    print(ftest$p.value)
#    }
#  }
#
##clean up
#rm(findex, i, ctab, ftest)