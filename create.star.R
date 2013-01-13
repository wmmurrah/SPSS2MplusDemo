# Create data frame with 100 randomly selected cases and 8 variables.
star <- STAR[sample(nrow(STAR),100),
             c('gender','ethnicity','readk','read1',
               'mathk','math1','school1','degreek')]

# save R data frame as comma separated values file to be imported
# into SPSS.
write.csv(star,file="star.csv")
# You can use the 'Read Text Data' menu option in SPSS to import this file into SPSS.