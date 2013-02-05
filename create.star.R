# Install and load AER package and open STAR data.
install.packages('AER')
library(AER)
data(STAR)

# Create data frame with 100 randomly selected cases and 8 variables.
set.seed(1234)
star <- STAR[sample(nrow(STAR),100),
             c('gender','ethnicity','readk','read1',
               'mathk','math1','school1','degreek')]

names(star) <- c('gender','ethnicity','readKindergarten','read1',
                 'mathKindergarten','math1','school1','degreek')

# save R data frame as comma separated values file to be imported
# into SPSS.
write.csv(star,file="star.csv",na=".")
# You can use the 'Read Text Data' menu option in SPSS to import this file into SPSS.