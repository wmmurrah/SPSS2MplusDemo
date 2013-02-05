
*This code imports the comma separated variable file created in R: star.csv.
*Note: this code renames the id variale "ChildIdentification.
GET DATA
  /TYPE=TXT
  /FILE="C:\Dropbox\3_Teaching\SPSS2MplusDemo\star.csv"
  /DELCASE=LINE
  /DELIMITERS=","
  /QUALIFIER='"'
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  ChildIdentification F6.0
  gender A6
  ethnicity A8
  readKindergarten F6.0
  read1 F6.0
  mathKindergarten F6.0
  math1 F6.0
  school1 A10
  degreek A8.
CACHE.
EXECUTE.
DATASET NAME DataSet8 WINDOW=FRONT.

SAVE OUTFILE='C:\Dropbox\3_Teaching\SPSS2MplusDemo\star.sav'
  /COMPRESSED.
