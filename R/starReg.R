
library(foreign)

star2 <- read.spss(file="data/star2012.12.17.sav",
                   use.value.labels=F,to.data.frame=T,use.missings=T)

mathmod <- lm(math1 ~ mathk + readk + male + other, star2)
summary(mathmod)
library(QuantPsyc)
mathcoefst <- lm.beta(mathmod)
mathcoefst

s.cmat <- cov(star2[,2:8],use="pairwise.complete")

s.cmat