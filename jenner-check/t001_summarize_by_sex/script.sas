/* Summarize step from
   utl-altair-slc-native-language5-odbc-read-write-text-files-summarize-and-looping-with-sqlite.sas

   The original loads the five-row `have` table into SQLite over ODBC and runs
   the group-by-sex aggregate as a passthrough query. Here the same `have` rows
   (the exact cards4 block from the source) live in a native DATA step, and the
   identical aggregation runs in PROC SQL so it is portable across engines.
   Result matches the documented WORKX.AVGS: F -> avgage 13.3333 / avghgt 61.5333,
   M -> avgage 14 / avghgt 66.25. */

data have;
  informat
    line    $24.
    name    $8.
    sex     $1.
    age     8.
    height  8.
    ;
 input name sex age height line &;
cards4;
Alfred M 14 69 This is the 1st line
Alice F 13 56.5 This is the 2nd line
Barbara F 13 65.3 This is the 3rd line
Carol F 14 62.8 This is the 4th line
Henry M 14 63.5 This is the 5th line
;;;;
run;

proc sql;
   create table avgs as
   select
       sex
      ,count(*)     as n
      ,avg(age)     as avgage
      ,avg(height)  as avghgt
   from
       have
   group
       by sex
   ;
quit;

proc print data=avgs; run;
