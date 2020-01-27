README
========

These files contain data and code discussed in a blogpost on my website (www.statistical-thinking.com) in the post entitled "Preparing and SPSS data file for Mplus". You can also visit a permanent github page at http://wmmurrah.github.com/SPSS2MplusDemo/ that also contains the tutorial .

Data
------

The data used is a subset of the STAR public access data file
which is available with the `AER` package for R.
Christian Kleiber and Achim Zeileis (2008). Applied Econometrics with R. New
York: Springer-Verlag. ISBN 978-0-387-77316-2. 
URL http://CRAN.R-project.org/package=AER

The create.star.R file contains R code to create the data file similar used in this demontration. The import_starcsvToSPSS.sps is the SPSS syntax file used to create the star.sps file from the star.csv file. You don't need these  code files for the tutorial, which starts with the star.sps data file. The code files are included to make this tutorial completely reproducible.

Data files include a raw data file (star.csv), an SPSS file (star.sav) and a tab delimited file (starMplus.dat), the latter of which can be used by Mplus.

Code
----

The SPSS syntax file (star.sps) contains syntax for the steps covered in this demonstration. An Mplus input file (starMplus.inp) and resulting output file (starMplus.out) are included for reference. 

Please contact me at william.murrah@gmail.com with questions or corrections.

