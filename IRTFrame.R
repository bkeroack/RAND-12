# IRT frame

a <- 0
length(a) <- 6
IRT_array <- array(0, c(6, 12))
IRT_DF <- data.frame(IRT_array)
names(IRT_DF) <- as.character(1:12)

for (i in 1:12) {
  tmpvect <- as.integer(unlist(strsplit(as.character(IRT$IRT[i]), ";")))
  length(tmpvect) <- 6
  tmpvect[is.na(tmpvect)] <- 0
  IRT_DF[[i]] <- tmpvect
}

LookupIRT <- function(response, question) {
  if (response == 0) { return(0) }
  IRT_DF[response, question]
}

#clean up
rm(a, IRT_array, i, tmpvect)
