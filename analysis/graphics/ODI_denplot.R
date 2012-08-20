# Generate ODI density plot w/ 95% CI lines

#Assumes dataframe ODI

##Filter data of insig diffs (diff < 10)
#ODI_filt <- ODI
#ODI_avg_pre <- ODI_filt$PreODI[abs(ODI_filt$Diff) < 10]
#ODI_avg_post <- ODI_filt$PostODI[abs(ODI_filt$Diff) < 10]
#ODI_a <- data.frame(PreODI = ODI_avg_pre, PostODI = ODI_avg_post)
#ODI_avg <- rowMeans(ODI_a)
#ODI_avg <- round(ODI_avg)
#ODI_filt$PreODI[abs(ODI_filt$Diff) < 10] <- ODI_avg
#ODI_filt$PostODI[abs(ODI_filt$Diff) < 10] <- ODI_avg
##recompute diffs
#ODI_filt$Diff <- ODI_filt$PreODI - ODI_filt$PostODI
#ODI <- ODI_filt
#rm(ODI_filt, ODI_avg_pre, ODI_avg_post, ODI_a, ODI_avg)

#Compute 95% CI's
n <- length(ODI$Acct)
odi_pre_mean <- mean(ODI$PreODI)
odi_post_mean <- mean(ODI$PostODI)
odi_pre_sd <- sd(ODI$PreODI)
odi_post_sd <- sd(ODI$PostODI)
odi_pre_sem <- sqrt((odi_pre_sd^2)/n)
odi_post_sem <- sqrt((odi_post_sd^2)/n)

odi_pre_ci_lo <- odi_pre_mean - (1.96 * odi_pre_sem)
odi_pre_ci_hi <- odi_pre_mean + (1.96 * odi_pre_sem)
odi_post_ci_lo <- odi_post_mean - (1.96 * odi_post_sem)
odi_post_ci_hi <- odi_post_mean + (1.96 * odi_post_sem)

# Run t-test
#SigTest_vareq <- t.test(ODI$PreODI, ODI$PostODI, var.equal = TRUE)
#SigTest_indep <- t.test(ODI$PreODI, ODI$PostODI, var.equal = FALSE)

#Graphics file to write
odiPlot <- pdf(filename = "../Results/Figures/ODI_denplot.pdf", width = 1024,
                height = 768, compression = "none")
                
# Construct plot
dev.set(odiPlot)
d <- density(ODI$PreODI)
plot(d, main = "ODI Pre/Post Scores")
d2 <- density(ODI$PostODI)
points(d2, type = "o", cex = 0.6, pch = c(2, NA, NA, NA, NA), col = "gray")
                                  
#CI lines
#xline(odi_pre_ci_lo, lty = "dotted")
#xline(odi_pre_ci_hi, lty = "dotted")
#xline(odi_post_ci_lo, lty = "dotdash")
#xline(odi_post_ci_hi, lty = "dotdash")

legend("topright", inset = 0.02, legend = c("Pre ODI", "Post ODI"), 
        lty = c("solid", "solid"), col = c("black", "gray"),
        pch = c(NA, 2))
dev.off()
        
#clean up
rm(n, odi_pre_mean, odi_post_mean, odi_pre_sd, odi_post_sd, odi_pre_sem, 
  odi_post_sem)
rm(odi_pre_ci_lo, odi_pre_ci_hi, odi_post_ci_lo, odi_post_ci_hi)
rm(d, d2, odiPlot)
#rm(SigTest_vareq, SigTest_indep)








