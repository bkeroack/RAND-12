RAND-12 Scoring Script(s) in R
------------------------------

See http://www.r-project.org/ for information regarding R Statistical Programming language.

The RAND-12 instrument[1] is a standardized health questionnaire designed to quantitatively assess health and wellness. It is similar to the widely-used proprietary SF-12 instrument. Because RAND-12 was developed by the RAND Corporation it is in the public domain and therefore requires no royalties for use unlike the SF-* instruments.

Although the SF-* have automated proprietary software scoring solutions, no such tool exists for the RAND-* instruments. The only scoring methodology available is a pen and paper worksheet supplied with the official book. This is clearly not feasible for large scale studies.

Therefore I wrote the accompanying scripts for a study I conducted. The study I did used the RAND-12 (actually two copies) with the questions in a randomized order along with the Oswestry disability index and some demographic questions. Because of this these scripts are considerably more complex than would be strictly necessary for the RAND-12 alone.

1. http://www.rand.org/health/surveys_tools/mos/mos_core_12item.html

USE:

1) READ THE SOURCE. The scripts require your data to be in specifically-named data frames and expects data columns in a particular format.

2) The entry point for RAND-12 scoring alone is "ScoreRAND.R". Note that you must uncommment a few lines at the top to enable the file chooser for your source data. A CSV file is required with specific named columns (read the source).

3) The entry point for my study is "ScoreAll.R". It does a bunch of things including re-ordering the questions and scoring the RAND-12 and Oswestry. It is included but probably not applicable to any other studies.

4) The 'analysis' folder contains the various scripts I wrote to generate the graphics used in the final paper.


LICENSE:

All scripts are placed into the public domain. Note that R itself is released under the GPL. 
