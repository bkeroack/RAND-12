# Generate plots of RAND-12 t scores

# Assumes dataframe 'RAND'

# calculate CI's
#n <- length(RAND$Acct)
rand_pre_ghc_mean <- mean(RAND$PreGHC)
rand_post_ghc_mean <- mean(RAND$PostGHC)
rand_pre_mhc_mean <- mean(RAND$PreMHC)
rand_post_mhc_mean <- mean(RAND$PostMHC)
rand_pre_phc_mean <- mean(RAND$PrePHC)
rand_post_phc_mean <- mean(RAND$PostPHC)

rand_pre_ghc_sem <- std.error(RAND$PreGHC)
rand_post_ghc_sem <- std.error(RAND$PostGHC)
rand_pre_mhc_sem <- std.error(RAND$PreMHC)
rand_post_mhc_sem <- std.error(RAND$PostMHC)
rand_pre_phc_sem <- std.error(RAND$PrePHC)
rand_post_phc_sem <- std.error(RAND$PostPHC)

rand_pre_ghc_ci <- c( rand_pre_ghc_mean - (1.96 * rand_pre_ghc_sem),
                      rand_pre_ghc_mean + (1.96 * rand_pre_ghc_sem))
rand_post_ghc_ci <- c( rand_post_ghc_mean - (1.96 * rand_post_ghc_sem),
                      rand_post_ghc_mean + (1.96 * rand_post_ghc_sem))
rand_pre_mhc_ci <- c( rand_pre_mhc_mean - (1.96 * rand_pre_mhc_sem),
                      rand_pre_mhc_mean + (1.96 * rand_pre_mhc_sem))
rand_post_mhc_ci <- c( rand_post_mhc_mean - (1.96 * rand_post_mhc_sem),
                      rand_post_mhc_mean + (1.96 * rand_post_mhc_sem))
rand_pre_phc_ci <- c( rand_pre_phc_mean - (1.96 * rand_pre_phc_sem),
                      rand_pre_phc_mean + (1.96 * rand_pre_phc_sem))                                                                                         
rand_post_phc_ci <- c( rand_post_phc_mean - (1.96 * rand_post_phc_sem),
                      rand_post_phc_mean + (1.96 * rand_post_phc_sem))

#Generate plots

ghcPlot_ref <- pdf(file = "../Results/Figures/GHC_denplot_ref.pdf")                                        
dev.set(ghcPlot_ref)
#dev.set(windows(width = 1024, height = 768))
d <- density(RAND$PreGHC); plot(d, main = "RAND-12 Pre/Post GHC Scores [vs normal dist]")
d2 <- density(RAND$PostGHC); points(d2, type = "o", cex = 1, pch = c(4, NA, NA, NA), col = "grey")

#Reference normal dist plot
curve(dnorm(x, mean=50, sd=10), from=0, to=65, add = TRUE, lty = "dotted", type = "h")
legend("topleft", inset = 0.02, legend = c("Pre GHC", "Post GHC", 
        "Norm dist (reference)"), 
        lty = c("solid", "solid", "dotted"),
        pch = c(NA, 4, NA), col = c("black", "grey", "black") )
dev.off()

ghcPlot_ci <- pdf(file = "../Results/Figures/GHC_denplot_ci.pdf")
dev.set(ghcPlot_ci)
#dev.set(windows(width = 1024, height = 768))
d <- density(RAND$PreGHC); plot(d, main = "RAND-12 Pre/Post GHC Scores")
d2 <- density(RAND$PostGHC); points(d2, type = "o", cex = 1, pch = c(4, NA, NA, NA), col = "grey")

#CI lines
xline(rand_pre_ghc_ci[1], lty = "dashed")
xline(rand_pre_ghc_ci[2], lty = "dashed")
xline(rand_post_ghc_ci[1], lty = "dotdash")
xline(rand_post_ghc_ci[2], lty = "dotdash")

legend("topleft", inset = 0.02, legend = c("Pre GHC", "Post GHC", 
        "Pre GHC mean 95% confidence interval", "Post GHC mean 95% confidence interval"), 
        lty = c("solid", "solid", "dashed", "dotdash"),
        pch = c(NA, 4, NA, NA), col = c("black", "grey", "black", "black") )
dev.off()

phcPlot_ref <- pdf(file = "../Results/Figures/PHC_denplot_ref.pdf")
dev.set(phcPlot_ref)
#dev.set(windows(width = 1024, height = 768))
d <- density(RAND$PrePHC); plot(d, main = "RAND-12 Pre/Post PHC Scores [vs normal dist]")
d2 <- density(RAND$PostPHC); points(d2, type = "o", cex = 1, pch = c(4, NA, NA, NA), col = "grey")

#Reference normal dist plot
curve(dnorm(x, mean=50, sd=10), from=0, to=65, add = TRUE, lty = "dotted", type = "h")
legend("topleft", inset = 0.02, legend = c("Pre PHC", "Post PHC", 
        "Norm dist (reference)"), 
        lty = c("solid", "solid", "dotted"),
        pch = c(NA, 4, NA), col = c("black", "grey", "black") )
dev.off()

phcPlot_ci <- pdf(file = "../Results/Figures/PHC_denplot_ci.pdf")
dev.set(phcPlot_ci)
#dev.set(windows(width = 1024, height = 768))
d <- density(RAND$PrePHC); plot(d, main = "RAND-12 Pre/Post PHC Scores")
d2 <- density(RAND$PostPHC); points(d2, type = "o", cex = 1, pch = c(4, NA, NA, NA), col = "grey")

#CI lines
xline(rand_pre_phc_ci[1], lty = "dashed")
xline(rand_pre_phc_ci[2], lty = "dashed")
xline(rand_post_phc_ci[1], lty = "dotdash")
xline(rand_post_phc_ci[2], lty = "dotdash")

legend("topleft", inset = 0.02, legend = c("Pre PHC", "Post PHC", 
        "Pre PHC mean 95% confidence interval", "Post PHC mean 95% confidence interval"), 
        lty = c("solid", "solid", "dashed", "dotdash"),
        pch = c(NA, 4, NA, NA), col = c("black", "grey", "black", "black") )
dev.off()

mhcPlot_ref <- pdf(file = "../Results/Figures/MHC_denplot_ref.pdf")
dev.set(mhcPlot_ref)
#dev.set(windows(width = 1024, height = 768))
d <- density(RAND$PreMHC); plot(d, main = "RAND-12 Pre/Post MHC Scores [vs normal dist]", ylim = c(0, 0.05))
d2 <- density(RAND$PostMHC); points(d2, type = "o", cex = 1, pch = c(4, NA, NA, NA), col = "grey")

#Reference normal dist plot
curve(dnorm(x, mean=50, sd=10), from=0, to=65, add = TRUE, lty = "dotted", type = "h")
legend("topleft", inset = 0.02, legend = c("Pre MHC", "Post MHC", 
        "Norm dist (reference)"), 
        lty = c("solid", "solid", "dotted"),
        pch = c(NA, 4, NA), col = c("black", "grey", "black") )
dev.off()

mhcPlot_ci <- pdf(file = "../Results/Figures/MHC_denplot_ci.pdf")
dev.set(mhcPlot_ci)
#dev.set(windows(width = 1024, height = 768))
d <- density(RAND$PreMHC); plot(d, main = "RAND-12 Pre/Post MHC Scores", ylim = c(0, 0.05))
d2 <- density(RAND$PostMHC); points(d2, type = "o", cex = 1, pch = c(4, NA, NA, NA), col = "grey")

#CI lines
xline(rand_pre_mhc_ci[1], lty = "dashed")
xline(rand_pre_mhc_ci[2], lty = "dashed")
xline(rand_post_mhc_ci[1], lty = "dotdash")
xline(rand_post_mhc_ci[2], lty = "dotdash")

legend("topleft", inset = 0.02, legend = c("Pre MHC", "Post MHC", 
        "Pre MHC 95% confidence interval", "Post MHC 95% confidence interval"), 
        lty = c("solid", "solid", "dashed", "dotdash"),
        pch = c(NA, 4, NA, NA), col = c("black", "grey", "black", "black") )
dev.off()
                 
#Run t-tests
#ST_ghc <- t.test(RAND$PreGHC, RAND$PostGHC)
#ST_mhc <- t.test(RAND$PreMHC, RAND$PostMHC)
#ST_phc <- t.test(RAND$PrePHC, RAND$PostPHC)

#clean up
rm(
rand_pre_ghc_mean, 
rand_post_ghc_mean, 
rand_pre_mhc_mean,
rand_post_mhc_mean, 
rand_pre_phc_mean, 
rand_post_phc_mean,              
rand_pre_ghc_sem, 
rand_post_ghc_sem, 
rand_pre_mhc_sem,
rand_post_mhc_sem,
rand_pre_phc_sem,
rand_post_phc_sem, 
rand_pre_ghc_ci, 
rand_post_ghc_ci, 
rand_pre_mhc_ci, 
rand_post_mhc_ci, 
rand_pre_phc_ci,                                                                                          
rand_post_phc_ci,
d, d2, 
ghcPlot_ref,
mhcPlot_ref, 
phcPlot_ref, 
ghcPlot_ci, 
mhcPlot_ci,
phcPlot_ci) 

