/* Loop/median step from
   utl-altair-slc-native-language5-odbc-read-write-text-files-summarize-and-looping-with-sqlite.sas

   The original iterates over the numbers 1..10 with a SQLite RECURSIVE CTE and
   computes their median as a passthrough query, yielding WORKX.MEDIAN_VALUE = 5.5.
   Here the same 1..10 sequence is generated in a native DATA-step DO loop and the
   median is taken with PROC MEANS, so the demo runs without ODBC/SQLite. */

data nums;
  do x = 1 to 10;
    output;
  end;
run;

proc means data=nums median noprint;
  var x;
  output out=median_value(drop=_type_ _freq_) median=median;
run;

proc print data=median_value; run;
