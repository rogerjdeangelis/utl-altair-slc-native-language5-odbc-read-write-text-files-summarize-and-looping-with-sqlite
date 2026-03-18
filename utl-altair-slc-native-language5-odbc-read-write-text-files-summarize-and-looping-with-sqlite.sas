%let pgm=utl-altair-slc-native-language5-odbc-read-write-text-files-summarize-and-looping-with-sqlite;

%stop_submission;

Altair slc native language5 odbc read write text files and summarize and looping with sqlite

Note none of the process queries are supported by the slc 'proc sql' or sas 'proc sql'
Note character strings are defaulting to 1024 bytes, to fix this you need to define
the table attributes explicitly in sqlite. Macro utl_optlenpos will optimize the lengths of all variables.


Too long to post on a list, see github
https://github.com/rogerjdeangelis/utl-altair-slc-native-language5-odbc-read-write-text-files-summarize-and-looping-with-sqlite


Note: Note sqlite has csv read and write commands, however I want to present general txt processing in sql.
      Keep in mind that I am demonstrating that the exact sqlite queries work in the 9 languages below.
      In addition you use the exact same queries in any language or operating system that is odbc compliant.


related repos (see for information of installing odbc and sqlite)

https://github.com/rogerjdeangelis/utl-altair-slc-sqlite-cheat-sheet
https://github.com/rogerjdeangelis/utl-altair-slc-language1-drop-down-to-open-source-spss-and-execute-postgresql-query
https://github.com/rogerjdeangelis/utl-altair-slc-language2-drop-down-to-open-source-matlab-and-execute-sqlite-with-extensions
https://github.com/rogerjdeangelis/utl-altair-slc-language3-proc-r-read-write-csv-files-and-summarize-and-looping-with-sqlite
https://github.com/rogerjdeangelis/utl-altair-slc-language4-proc-python-read-write-csv-files-and-summarize-and-looping-with-sqlite
https://github.com/rogerjdeangelis/utl-altair-slc-native-language5-odbc-read-write-text-files-summarize-and-looping-with-sqlite

PROBLEM

  PROCESS

  1  slc create sqlite table 'have' with 3 lines (sentences) and column name line

     d:/sqlite/mysqlite.db table have
     line

     This is the 1st line
     This is the 2nd line
     This is the 3rd line

  2  slc summarize sqlite table

     select sex avg(age) avg(height) from have group by sex


  3  slc convert sqlite table 'have' to text file using sqlite 'writefile' command

     d:/txt/have.txt

     This is the 1st line
     This is the 2nd line
     This is the 3rd line

  4  slc convert text file 'd:/txt/have.txt' to slc dataframe using sqlite readfile

      text

      This is the 1st line
      This is the 2nd line
      This is the 3rd line

  5  slc iterate(loop) over numbers 1-10 and output median (5.5)


OBJECTIVE

  I am trying to make sql programmers expert programmers in
  9 languages using exactly the same sql queries.
  Use packages and procedures for analysis and sql for data wrangling and interfacing.

  Add very powerfull sql processing to the open source spss
  Posgresql has windows extensions.

  I hope to add repos with  drop downs to sql with windows extensions in many languages

 *language 1   open source spss
 *language 2   open source matlab
 *language 3   r
 *language 4   python
 *language 5   altair odbc sqlite
  language 6   excel
  language 7   perl
  language 8   powershell

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

* best first;
%utlfkil(d:/sqlite/mysqlite.db);

libname workx sas7bdat "d:/wpswrkx"; /*---  put in autoexec ---*/

proc datasets lib=workx kill;
run;

libname sqlite odbc noprompt="driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;";

proc datasets lib=sqlite;
 delete have;
run;

options validvarname=v7;
data sqlite.have;
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
run;quit;

proc contents data=sqlite.have;
run;

proc print data=sqlite.have;
run;

proc sql;
 SELECT sql FROM sqlite.sqlite_master WHERE name='have'
;quit;

libname sqlite clear;

/**************************************************************************************************************************/
/* sqlite table have in database d:/sqlite/mysqlite.db                                                                    */
/*                                                                                                                        */
/* sqlite.have                                                                                                            */
/*                                                                                                                        */
/* line                        name        sex    age    height                                                           */
/*                                                                                                                        */
/* This is the 1st line        Alfred       M      14     69.0                                                            */
/* This is the 2nd line        Alice        F      13     56.5                                                            */
/* This is the 3rd line        Barbara      F      13     65.3                                                            */
/* This is the 4th line        Carol        F      14     62.8                                                            */
/* This is the 5th line        Henry        M      14     63.5                                                            */
/*                                                                                                                        */
/* sqlite table have contents                                                                                             */
/*                                                                                                                        */
/* CREATE TABLE have( line VARCHAR(24), name VARCHAR(8), sex VARCHAR(1), age DOUBLE PRECISION, height DOUBLE PRECISION )  */
/*                                                                                                                        */
/* Altair SLC                                                                                                             */
/*                                                                                                                        */
/* The CONTENTS Procedure                                                                                                 */
/*                                                                                                                        */
/* Data Set Name           HAVE                                                                                           */
/* Member Type             VIEW                                                                                           */
/* Engine                                                                                                                 */
/* Observations            .                                                                                              */
/* Variables               5                                                                                              */
/* Indexes                 0                                                                                              */
/* Observation Length      49                                                                                             */
/* Deleted Observations    0                                                                                              */
/* Data Set Type                                                                                                          */
/* Label                                                                                                                  */
/* Compressed              NO                                                                                             */
/* Sorted                  NO                                                                                             */
/* Data Representation                                                                                                    */
/* Encoding                wlatin1 Windows-1252 Western                                                                   */
/*                                                                                                                        */
/*       Alphabetic List of Variables and Attributes                                                                      */
/*                                                                                                                        */
/* Number    Variable    Type  Len   Pos    Format Informat                                                               */
/* ________________________________________________________                                                               */
/*      4    age         Num     8    33                                                                                  */
/*      5    height      Num     8    41                                                                                  */
/*      1    line        Char   24     0    $24.   $24.                                                                   */
/*      2    name        Char    8    24    $8.    $8.                                                                    */
/*      3    sex         Char    1    32    $1.    $1.                                                                    */
/**************************************************************************************************************************/

/*                   _     _
(_)_ __  _ __  _   _| |_  | | ___   __ _
| | `_ \| `_ \| | | | __| | |/ _ \ / _` |
| | | | | |_) | |_| | |_  | | (_) | (_| |
|_|_| |_| .__/ \__,_|\__| |_|\___/ \__, |
        |_|                        |___/
*/

1                                          Altair SLC       11:04 Wednesday, March 18, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"

NOTE: AUTOEXEC processing completed

1         * best first;
2         %utlfkil(d:/sqlite/mysqlite.db);
3
4         libname workx sas7bdat "d:/wpswrkx"; /*---  put in autoexec ---*/
NOTE: Library workx assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\wpswrkx


Altair SLC

The DATASETS Procedure

         Directory

Libref           WORKX
Engine           SAS7BDAT
Physical Name    d:\wpswrkx

                                 Members

                            Member
  Number    Member Name     Type         File Size      Date Last Modified

--------------------------------------------------------------------------

       1    AVGS            DATA             17408      18MAR2026:10:40:15
       2    LINES           DATA             17408      18MAR2026:10:57:24
       3    MEDIAN_VALUE    DATA              5120      18MAR2026:11:02:16
5
6         proc datasets lib=workx kill;
7         run;
NOTE: Deleting WORKX.avgs (type=DATA)
NOTE: Deleting WORKX.lines (type=DATA)
NOTE: Deleting WORKX.median_value (type=DATA)
8
9         libname sqlite odbc noprompt=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
NOTE: Library sqlite assigned as follows:
      Engine:        ODBC
      Physical Name:  (SQLite version 3.43.2)

NOTE: Procedure datasets step took :
      real time : 0.135
      cpu time  : 0.031



Altair SLC

The DATASETS Procedure

      Directory

Libref         SQLITE
Engine         ODBC
Data Source
10
11        proc datasets lib=sqlite;
NOTE: No matching members in directory
12         delete have;
13        run;
NOTE: SQLITE.HAVE (memtype="DATA") was not found, and has not been deleted
14
15        options validvarname=v7;
NOTE: Procedure datasets step took :
      real time : 0.020
      cpu time  : 0.015


16        data sqlite.have;
17          informat
18            line    $24.
19            name    $8.
20            sex     $1.
21            age     8.
22            height  8.
23            ;
24         input name sex age height line &;
25        cards4;

NOTE: Data set "SQLITE.have" has an unknown number of observation(s) and 5 variable(s)
NOTE: The data step took :
      real time : 0.159
      cpu time  : 0.015


26        Alfred M 14 69 This is the 1st line
27        Alice F 13 56.5 This is the 2nd line
28        Barbara F 13 65.3 This is the 3rd line
29        Carol F 14 62.8 This is the 4th line
30        Henry M 14 63.5 This is the 5th line
31        ;;;;
32        run;quit;
33
34        proc contents data=sqlite.have;
35        run;
NOTE: Procedure contents step took :
      real time : 0.062
      cpu time  : 0.031


36
37        proc print data=sqlite.have;
38        run;
NOTE: 5 observations were read from "SQLITE.have"
NOTE: Procedure print step took :
      real time : 0.018
      cpu time  : 0.015


39
40        proc sql;
41         SELECT sql FROM sqlite.sqlite_master WHERE name='have'
42        ;quit;
WARNING: truncating character column type to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column name to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column tbl_name to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column sql to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column sql to 1024 characters long, based on dbmax_text setting.
NOTE: Procedure sql step took :
      real time : 0.019
      cpu time  : 0.000


NOTE: Libref SQLITE has been deassigned.
43
44        libname sqlite clear;
ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 0.536
      cpu time  : 0.203

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|

Note you can combine all the proc sql procedures in one proc sql.
*/

proc datasets lib=workx kill;
run;

proc sql;
   connect to odbc as mycon (noprompt=
    "driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;");

   create table workx.avgs as

   select * from connection to mycon
   (
      /* Your SQLite query goes here */
      select
        group_concat(name) as names
       ,sex
       ,avg(age)    as avgage
       ,avg(height) as avghgt
      from
        have
      group
        by sex
   );

   disconnect from mycon;

quit;

proc print data=workx.avgs width=min;
format names $24.;
run;


%utlfkil(d:/txt/class_export.txt)

proc sql;
   connect to odbc as mycon (noprompt="driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;");

   execute (
      SELECT writefile(
         'd:/txt/class_export.txt',
         (SELECT group_concat(line, char(10)) FROM have)
      )
   ) by mycon;

   disconnect from mycon;
quit;


proc sql;
   connect to odbc as mycon (noprompt=
    "driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;");

   create table workx.lines as

   select * from connection to mycon
   (
     SELECT value AS lines
     FROM json_each('["' || replace(readfile('d:/txt/class_export.txt'), char(10), '","') || '"]')
   );

   disconnect from mycon;

quit;

proc print data=workx.lines;
run;quit;


proc sql;
   connect to odbc as mycon (noprompt=
    "driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;");

   create table workx.median_value as

   select * from connection to mycon
     (
        WITH RECURSIVE nums(x) AS (
          SELECT 1
          UNION ALL
          SELECT x + 1 FROM nums WHERE x < 10
        ),
        med AS (
          SELECT
            x,
            ROW_NUMBER() OVER (ORDER BY x) AS r,
            COUNT(*) OVER () AS c
          FROM nums
        )
        SELECT AVG(x) AS median
        FROM med
        WHERE r IN ((c+1)/2, (c+2)/2)
    );

proc print data=workx.median_value;
run;

/**************************************************************************************************************************/
/* SUMMARIZE                                                                                                              */
/* ---------                                                                                                              */
/* WORKX.AVGS total obs=2                                                                                                 */
/*                                                                                                                        */
/* Obs    NAMES                  SEX     AVGAGE     AVGHGT                                                                */
/*                                                                                                                        */
/*  1     Alice,Barbara,Carol     F     13.3333    61.5333                                                                */
/*  2     Alfred,Henry            M     14.0000    66.2500                                                                */
/*                                                                                                                        */
/*                                                                                                                        */
/* CREATE TEXT FILE                                                                                                       */
/* ----------------                                                                                                       */
/*  d:/txt/class_export.txt                                                                                               */
/*                                                                                                                        */
/*  This is the 1st line                                                                                                  */
/*  This is the 2nd line                                                                                                  */
/*  This is the 3rd line                                                                                                  */
/*  This is the 4th line                                                                                                  */
/*  This is the 5th line                                                                                                  */
/*                                                                                                                        */
/*                                                                                                                        */
/* CONVERT TEXT FILE TO SLC/SAS DATASET                                                                                   */
/* -----------------------------------                                                                                    */
/*  WORKX.LINES total obs=5                                                                                               */
/*                                                                                                                        */
/*                     txt                                                                                                */
/*  0 This is the 1st line                                                                                                */
/*  1 This is the 2nd line                                                                                                */
/*  2 This is the 3rd line                                                                                                */
/*  3 This is the 4th line                                                                                                */
/*  4 This is the 5th line                                                                                                */
/*                                                                                                                        */
/*AUTOCREATE NUMBERS 1-10 and cmpute median                                                                               */
/*-----------------------------------------                                                                               */
/* WORKX.MEDIAN_VALUE total obs=1 17MAR2026:13:53:59                                                                      */
/*                                                                                                                        */
/* Obs    MEDIAN                                                                                                          */
/*                                                                                                                        */
/*  1       5.5                                                                                                           */
/**************************************************************************************************************************/

/*
| | ___   __ _
| |/ _ \ / _` |
| | (_) | (_| |
|_|\___/ \__, |
         |___/
*/

1                                          Altair SLC       11:47 Wednesday, March 18, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"

NOTE: AUTOEXEC processing completed


Altair SLC

The DATASETS Procedure

         Directory

Libref           WORKX
Engine           SAS7BDAT
Physical Name    d:\wpswrkx

                              Members

            Member    Member
  Number    Name      Type         File Size      Date Last Modified

--------------------------------------------------------------------

       1    AVGS      DATA             17408      18MAR2026:11:12:38
1         proc datasets lib=workx kill;
2         run;
NOTE: Deleting WORKX.avgs (type=DATA)
NOTE: Procedure datasets step took :
      real time : 0.040
      cpu time  : 0.000


3
4         proc sql;
5            connect to odbc as mycon (noprompt=
6             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX);
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Successfully connected to database ODBC as alias MYCON.
7
8            create table workx.avgs as
9
10           select * from connection to mycon
11           (
12              /* Your SQLite query goes here */
13              select
14                group_concat(name) as names
15               ,sex
16               ,avg(age)    as avgage
17               ,avg(height) as avghgt
18              from
19                have
20              group
21                by sex
22           );
NOTE: Data set "WORKX.avgs" has 2 observation(s) and 4 variable(s)
23
24           disconnect from mycon;
NOTE: Successfully disconnected from database MYCON.
25
26        quit;
NOTE: Procedure sql step took :
      real time : 0.203
      cpu time  : 0.109


27
28        proc print data=workx.avgs width=min;
29        format names $24.;
30        run;
NOTE: 2 observations were read from "WORKX.avgs"
NOTE: Procedure print step took :
      real time : 0.005
      cpu time  : 0.000


31
32
33        %utlfkil(d:/txt/class_export.txt)
34
35        proc sql;
36           connect to odbc as mycon (noprompt=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX);
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Successfully connected to database ODBC as alias MYCON.
37
38           execute (
39              SELECT writefile(
40                 'd:/txt/class_export.txt',
41                 (SELECT group_concat(line, char(10)) FROM have)
42              )
43           ) by mycon;
WARNING: The passthrough statement returned at least one result set which has not been read because the query was run via an EXECUTE BY statement.
NOTE: Successfully passed statement to database MYCON.
44
45           disconnect from mycon;
NOTE: Successfully disconnected from database MYCON.
46        quit;
NOTE: Procedure sql step took :
      real time : 0.013
      cpu time  : 0.000


47
48
49        proc sql;
50           connect to odbc as mycon (noprompt=
51            XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX);
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Successfully connected to database ODBC as alias MYCON.
52
53           create table workx.lines as
54
55           select * from connection to mycon
56           (
57             SELECT value AS lines
58             FROM json_each('["' || replace(readfile('d:/txt/class_export.txt'), char(10), '","') || '"]')
59           );
NOTE: Data set "WORKX.lines" has 5 observation(s) and 1 variable(s)
60
61           disconnect from mycon;
NOTE: Successfully disconnected from database MYCON.
62
63        quit;
NOTE: Procedure sql step took :
      real time : 0.023
      cpu time  : 0.031


64
65        proc print data=workx.lines;
66        run;quit;
NOTE: 5 observations were read from "WORKX.lines"
NOTE: Procedure print step took :
      real time : 0.012
      cpu time  : 0.000


67
68
69        proc sql;
70           connect to odbc as mycon (noprompt=
71            XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX);
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Connected to DB:  (SQLite version 3.43.2)
NOTE: Successfully connected to database ODBC as alias MYCON.
72
73           create table workx.median_value as
74
75           select * from connection to mycon
76             (
77                WITH RECURSIVE nums(x) AS (
78                  SELECT 1
79                  UNION ALL
80                  SELECT x + 1 FROM nums WHERE x < 10
81                ),
82                med AS (
83                  SELECT
84                    x,
85                    ROW_NUMBER() OVER (ORDER BY x) AS r,
86                    COUNT(*) OVER () AS c
87                  FROM nums
88                )
89                SELECT AVG(x) AS median
90                FROM med
91                WHERE r IN ((c+1)/2, (c+2)/2)
92            );
NOTE: Data set "WORKX.median_value" has 1 observation(s) and 1 variable(s)
NOTE: Procedure sql step took :
      real time : 0.017
      cpu time  : 0.015


93
94        proc print data=workx.median_value;
95        run;
NOTE: 1 observations were read from "WORKX.median_value"
NOTE: Procedure print step took :
      real time : 0.006
      cpu time  : 0.000


ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 1.595
      cpu time  : 0.234

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
