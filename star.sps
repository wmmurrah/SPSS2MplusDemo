
*************************************************************************
*  This syntax can be modified for use with other SPSSS data files.
*  You must change the file paths to find your data files. Note that 
*  all variable created by this syntax are less than 8 characters long
*  to comply with the requirments of Mplus.
*
*
* The data file used is a subset of the STAR public access data file
* which is available with the AER package for R.
* Christian Kleiber and Achim Zeileis (2008). Applied Econometrics with R. New
*  York: Springer-Verlag. ISBN 978-0-387-77316-2. URL
*  http://CRAN.R-project.org/package=AER

**************************************************************************.

************************** STEP 1 **************** 
Make a copy of the SPSS data file.


* Open the original SPSS datafile.
GET
  FILE='C:\Dropbox\3_Teaching\SPSS2MplusDemo\star.sav'.
DATASET NAME DataSet1 WINDOW=FRONT.

*Save a copy of the original file to perform transformation on. 
* This way you always have an original copy of the data.

SAVE OUTFILE='C:\Dropbox\3_Teaching\SPSS2MplusDemo\star2012.12.17.sav'
  /COMPRESSED.

*close original data file.
DATASET CLOSE DataSet1.
* Open SPSS file created with above code.
GET
  FILE='C:\Dropbox\3_Teaching\SPSS2MplusDemo\star2012.12.17.sav'.
DATASET NAME DataSet2 WINDOW=FRONT.


************************** STEP 2 **************** 
 Recode Non-numeric variables into numeric variables.

DATASET ACTIVATE DataSet2.
RECODE 
gender
('female' = 0)
('male' = 1)
(MISSING=SYSMIS)
 into male.
EXECUTE.

* This code dummy codes the string variable 'ethnicity' into three variables:
* 'white', 'black', and 'hisp'.
RECODE ethnicity ("cauc"=1) (MISSING=SYSMIS) (ELSE=0) INTO white.
RECODE ethnicity ("afam"=1) (MISSING=SYSMIS) (ELSE=0) INTO black.
RECODE ethnicity ("hispanic"=1) (MISSING=SYSMIS) (ELSE=0) INTO hisp.
EXECUTE.


************************** STEP 3 **************** 
rename variables so length is 8 characters or shorter.

RENAME VARIABLES 
(ChildIdentification = childId)
(readKindergarten = readk)
(mathKindergarten = mathk).

*You can copy the variable names from SPSS and paste them into excel.
* Then while they are still highlighted, right-click, then copy them again.
* move the cursor to an empty cell, right-click and select 'paste special'.
* check the 'transpose' option and click ok. This will give you a row of the names.
* finally, copy the row of names and you can paste them into Mplus. I paste them into the 
* SPSS syntax file in case I have to recreate the Mplus file from scratch.

* variable names to be pasted in Mplus text file: 
childId	readk	read1	mathk	math1	male	white black hisp
.

* Next I save a new data file droping the non-numeric variables (e.g. gender, ethnicity) and any
 other variables I will not use in my analyses. For example, here the variables 'school1' and 'degreek' will also not
 be included in the new data file.

SAVE OUTFILE='C:\Dropbox\3_Teaching\SPSS2MplusDemo\star2012.12.17.sav'
  /DROP=gender ethnicity school1 degreek 
  /COMPRESSED.

DATASET CLOSE DataSet2.
GET
  FILE='C:\Dropbox\3_Teaching\SPSS2MplusDemo\star2012.12.17.sav'.
DATASET NAME DataSet2 WINDOW=FRONT.

************************** STEP 4 **************** 
recode all missing values to one value.

RECODE childid TO hisp (missing = -99).
MISSING VALUES childId TO hisp (-99).
execute.

************************** STEP 5 **************** 
save SPSS file as a tab delimited (.dat) file.

SAVE TRANSLATE OUTFILE='C:\Dropbox\3_Teaching\SPSS2MplusDemo\starMplus.dat'
  /TYPE=TAB
  /MAP
  /REPLACE
  /CELLS=VALUES.


************************** STEP 6 **************** 
Create Mplus code.

* Below is a skeleton of Mplus code you can manipulate to create your mplus code.
* Alternatively, you can use the Mplus Language Generator in the Mplus GUI.

************************************************
*                   Mplus Code                 *
************************************************
TITLE:  STAR analysis
DATA:
    FILE IS "C:\Dropbox\3_Teaching\
    SPSS2MplusDemo\starMplus.dat";
VARIABLE:
    NAMES ARE childId	readk	read1	mathk
    math1	male	ethnic;
    USEVARIABLES ARE readk-ethnic;
    MISSING ARE ALL (-99);
************************************************.
















