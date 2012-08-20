# Generate regression plots for weight vs indices

scatterplot(DiffPHC[Sex == "M"] ~ Weight[Sex == "M"],
            main = "DiffPHC vs Weight (Males), LOWESS and linear regressions")
abline(81.2063, -0.3070, lty = "dotted", col = "blue")
text(320, -25, labels = "lin reg > 222lbs", cex = 0.7, col = "blue")
xline(222, lty = "dashed")
text(220, -40, labels = "x = 222lbs", cex = 0.8)
legend("topright", inset = 0.02, legend = c("Linear regression (all data)",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.7)

scatterplot(DiffPHC[Sex == "F"] ~ Weight[Sex == "F"],
            main = "DiffPHC vs Weight (Females), LOWESS and linear regressions")
legend("topright", inset = 0.02, legend = c("Linear regression (all data)",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.7)

scatterplot(DiffODI[Sex == "M"] ~ Weight[Sex == "M"],
            main = "DiffODI vs Weight (Males), LOWESS and linear regressions")
xline(222, lty = "dashed")
text(220, -55, labels = "x = 222lbs", cex = 0.7)
abline(-147.1542, 0.5384, lty = "dotted", col = "blue")
text(305, 30, labels = "lin reg > 222lbs", col = "blue", cex = 0.7)
#abline(17.7279, -0.1616, lty = "dotted", col = "blue")
legend("topright", inset = 0.02, legend = c("Linear regression (all data)",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.7)


scatterplot(PrePHC ~ Age, main = "Pre treatment (retrospective) PHC scores vs Age",
            smooth = FALSE, reg.line = FALSE)
xline(47, lty = "dotted")
text(51, 12, labels = "x = 47yrs", cex = 0.8)
abline(34.1236, -0.0566, lty = "dashed", col = "blue")
abline(9.3582, 0.2913, lty = "dotdash", col = "red")
legend("topright", inset = 0.02, legend = c("Linear regression (age < 47)",
        "Linear regression (age >= 47)"), lty = c("dotdash", "dashed"),
        col = c("red", "blue"), cex = 0.7)

#=====================FIGURES USED IN PROFILES BELOW=========================


scatterplot(PostPHC ~ Weight, boxplots = FALSE, cex = 0.5,
            main = "PHC vs weight (lbs)")
xline(225, lty = "dashed")
text(220, 15, labels = "x = 225lbs", cex = 0.7)
legend("topright", inset = 0.02, legend = c("Linear regression",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.7)

scatterplot(PostPHC ~ Age, boxplots = FALSE, cex = 0.5,
            main = "PHC vs age")
legend("topright", inset = 0.02, legend = c("Linear regression",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.5)

scatterplot(PostODI ~ Age, boxplots = FALSE, cex = 0.5,
            main = "ODI vs age")
legend("topright", inset = 0.02, legend = c("Linear regression",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.5)

scatterplot(DiffPHC ~ Weight, boxplots = FALSE, cex = 0.5, subset = Weight != 0,
            main = "PHC difference [pre/post] vs weight")
xline(225, lty = "dashed")
text(220, -40, labels = "x = 225lbs", cex = 0.7)
legend("topright", inset = 0.02, legend = c("Linear regression",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.7)

scatterplot(DiffODI ~ Weight, boxplots = FALSE, cex = 0.5, subset = Weight != 0,
            main = "ODI difference [pre/post] vs weight")
xline(225, lty = "dashed")
text(220, -40, labels = "x = 225lbs", cex = 0.7)
legend("topright", inset = 0.02, legend = c("Linear regression",
        "LOWESS"), lty = c("dashed", "solid"), col = c("red", "red"), cex = 0.7)

plot(density(posdf$Age), main = "Age", cex = 0.5)
points(density(negdf$Age), cex = 0.5, lty = "dashed", type = "l")
legend("topright", legend = c("+", "-"), lty = c("solid", "dashed"), cex = 0.7)

plot(density(negdf$Weight), main = "Weight (lbs)", cex = 0.5, lty = "dashed")
points(density(posdf$Weight), cex = 0.5, lty = "solid", type = "l")
legend("topright", legend = c("+", "-"), lty = c("solid", "dashed"), cex = 0.7)

plot(density(negdf$BMI, na.rm = TRUE), main = "BMI", cex = 0.5, lty = "dashed")
points(density(posdf$BMI, na.rm = TRUE), cex = 0.5, lty = "solid", type = "l")
legend("topright", legend = c("+", "-"), lty = c("solid", "dashed"), cex = 0.7)

plot(density(negdf$Height[negdf$Height > 20]), main = "Height (inches)", cex = 0.5, lty = "dashed")
points(density(posdf$Height[posdf$Height > 20]), cex = 0.5, lty = "solid", type = "l")
legend("topright", legend = c("+", "-"), lty = c("solid", "dashed"), cex = 0.7)
