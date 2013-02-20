******************************************************.
* Descriptive statistics to compare with Mplus.
* Notice the "MISSING" option, which is necessary to compare to 
* 'LISTWISE = ON;' option in Mplus.
*******************************************************.
DATASET ACTIVATE DataSet2.
DESCRIPTIVES VARIABLES=readk read1 mathk math1 male white other
  /STATISTICS=MEAN STDDEV MIN MAX
 /MISSING=LISTWISE.

FREQUENCIES VARIABLES=male white other
  /ORDER=ANALYSIS
 /MISSING=INCLUDE.

*****************************************************************
*        Parital Mplus code for equivalent analysis           *
*                   NOTE: listwise = on;                              *
*****************************************************************
  TITLE:  STAR analysis
    DATA:
    FILE IS "C:\Dropbox\3_Teaching\SPSS2MplusDemo\starMplus.dat";
  listwise = on;
  VARIABLE:
    NAMES ARE childId	readk	read1	mathk	math1
    male	white black hisp;
*****************************************************************.

*******************************************************************
*                     Descriptives will all cases                       *
*******************************************************************.

*Analyze Patterns of Missing Values.
MULTIPLE IMPUTATION  readk read1 mathk math1 male white other
   /IMPUTE METHOD=NONE
   /MISSINGSUMMARIES  OVERALL VARIABLES (MAXVARS=25 MINPCTMISSING=10) PATTERNS.

MVA VARIABLES=readk read1 mathk math1 male white other
  /MAXCAT=25
  /CATEGORICAL=male white other
  /TPATTERN PERCENT=1.

FREQUENCIES VARIABLES=male white other
  /ORDER=ANALYSIS.


