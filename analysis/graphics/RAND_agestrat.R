# Generate age stratified values

d_18to35_mean_phcdiff <- mean(RAND$DiffPHC[RAND$Age >= 18 & RAND$Age < 35])
d_35to45_mean_phcdiff <- mean(RAND$DiffPHC[RAND$Age >= 35 & RAND$Age < 45])
d_45to55_mean_phcdiff <- mean(RAND$DiffPHC[RAND$Age >= 45 & RAND$Age < 55])
d_55to65_mean_phcdiff <- mean(RAND$DiffPHC[RAND$Age >= 55 & RAND$Age < 65])
d_65plus_mean_phcdiff <- mean(RAND$DiffPHC[RAND$Age >= 65])

d_18to35_mean_ghcdiff <- mean(RAND$DiffGHC[RAND$Age >= 18 & RAND$Age < 35])
d_35to45_mean_ghcdiff <- mean(RAND$DiffGHC[RAND$Age >= 35 & RAND$Age < 45])
d_45to55_mean_ghcdiff <- mean(RAND$DiffGHC[RAND$Age >= 45 & RAND$Age < 55])
d_55to65_mean_ghcdiff <- mean(RAND$DiffGHC[RAND$Age >= 55 & RAND$Age < 65])
d_65plus_mean_ghcdiff <- mean(RAND$DiffGHC[RAND$Age >= 65])

d_18to35_mean_mhcdiff <- mean(RAND$DiffMHC[RAND$Age >= 18 & RAND$Age < 35])
d_35to45_mean_mhcdiff <- mean(RAND$DiffMHC[RAND$Age >= 35 & RAND$Age < 45])
d_45to55_mean_mhcdiff <- mean(RAND$DiffMHC[RAND$Age >= 45 & RAND$Age < 55])
d_55to65_mean_mhcdiff <- mean(RAND$DiffMHC[RAND$Age >= 55 & RAND$Age < 65])
d_65plus_mean_mhcdiff <- mean(RAND$DiffMHC[RAND$Age >= 65])

# Sex stratified
female_mean_phcdiff <- mean(RAND$DiffPHC[RAND$Sex == 'F'])
female_mean_ghcdiff <- mean(RAND$DiffGHC[RAND$Sex == 'F'])
female_mean_mhcdiff <- mean(RAND$DiffMHC[RAND$Sex == 'F'])

male_mean_phcdiff <- mean(RAND$DiffPHC[RAND$Sex == 'M'])
male_mean_ghcdiff <- mean(RAND$DiffGHC[RAND$Sex == 'M'])
male_mean_mhcdiff <- mean(RAND$DiffMHC[RAND$Sex == 'M'])

rm(
d_18to35_mean_phcdiff,
d_35to45_mean_phcdiff,
d_45to55_mean_phcdiff,
d_55to65_mean_phcdiff,
d_65plus_mean_phcdiff,

d_18to35_mean_ghcdiff,
d_35to45_mean_ghcdiff,
d_45to55_mean_ghcdiff,
d_55to65_mean_ghcdiff,
d_65plus_mean_ghcdiff,

d_18to35_mean_mhcdiff,
d_35to45_mean_mhcdiff,
d_45to55_mean_mhcdiff,
d_55to65_mean_mhcdiff,
d_65plus_mean_mhcdiff)


# Density plots
den_1 <- density(RAND$DiffPHC[RAND$Age < 35])
den_2 <- density(RAND$DiffPHC[RAND$Age >= 35 & RAND$Age <45])
den_3 <- density(RAND$DiffPHC[RAND$Age >= 45 & RAND$Age <55])
den_4 <- density(RAND$DiffPHC[RAND$Age >= 55 & RAND$Age <65])
den_5 <- density(RAND$DiffPHC[RAND$Age >= 65])

plot(den_1)
points(den_2)
points(den_3)
points(den_4)
points(den_5)

xline(mean(RAND$DiffPHC[RAND$Age < 35]))
xline(mean(RAND$DiffPHC[RAND$Age >= 35 & RAND$Age <45]))
xline(mean(RAND$DiffPHC[RAND$Age >= 45 & RAND$Age <55]))
xline(mean(RAND$DiffPHC[RAND$Age >= 55 & RAND$Age <65]))
xline(mean(RAND$DiffPHC[RAND$Age >= 65]))

mean(RAND$DiffPHC[RAND$Age < 35])
mean(RAND$DiffPHC[RAND$Age >= 35 & RAND$Age <45])
xline(mean(RAND$DiffPHC[RAND$Age >= 45 & RAND$Age <55]))
xline(mean(RAND$DiffPHC[RAND$Age >= 55 & RAND$Age <65]))
xline(mean(RAND$DiffPHC[RAND$Age >= 65]))

rm(den_1, den_2, den_3, den_4, den_5)