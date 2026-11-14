#!/bin/bash

FS='","'
girlsMathScoreOver60=$(awk -F $FS '/female/ && ($6 > 60) { gCounter++ } END { print gCounter }' StudentsPerformance.csv)

echo "Ilosc dziewczat majacych wynik z matematyki wiekszy niz 60 wynosi: $girlsMathScoreOver60"

boysQuantity=$(awk -F $FS '/male/ && $1 !~ /female/ { bCounter++ } END { print bCounter }' StudentsPerformance.csv)
boysReadingSum=$(awk -F $FS '/male/ && $1 !~ /female/ { sum += $7 } END { print sum }' StudentsPerformance.csv)
boysReadingAverage=$(echo "$boysReadingSum / $boysQuantity" | bc -l)
echo "Sredni wynik chlopcow z czytania wynosi: $boysReadingAverage"

girlsQuantity=$(awk -F $FS '/female/ { gCounter++ } END { print gCounter }' StudentsPerformance.csv)
girlsReadingSum=$(awk -F $FS '/female/ { sum += $7 } END { print sum }' StudentsPerformance.csv)
girlsReadingAverage=$(echo "$girlsReadingSum / $girlsQuantity" | bc -l)
echo "Sredni wynik dziewczat z czytania wynosi: $girlsReadingAverage"

boysMinReadingScore=$(awk -F $FS 'BEGIN { min = 1000000 } /male/ && $1 !~ /female/ { if ( $7 < min ) min = $7 } END { print min }' StudentsPerformance.csv)
echo "Najgorszy wynik z czytania dla chlopcow to: $boysMinReadingScore"

boysMaxReadingScore=$(awk -F $FS 'BEGIN { max = 0 } /male/ && $1 !~ /female/ { if ( $7 > max ) max = $7 } END { print max }' StudentsPerformance.csv)
echo "Najlepszy wynik z czytania dla chlopcow to: $boysMaxReadingScore"

boysMinWritingScore=$(awk -F $FS 'BEGIN { min = 1000000 } /male/ && $1 !~ /female/ { if ( $8 < min ) min = $8 } END { print min }' StudentsPerformance.csv)
echo "Najgorszy wynik z pisania dla chlopcow to: $boysMinWritingScore"

boysMaxWritingScore=$(awk -F $FS 'BEGIN { max = 0 } /male/ && $1 !~ /female/ { if ( $8 > max ) max = $8 } END { print max }' StudentsPerformance.csv)
echo "Najlepszy wynik z pisania dla chlopcow to: $boysMaxWritingScore"

girlsMinReadingScore=$(awk -F $FS 'BEGIN { min = 1000000 } /female/ { if ( $7 < min ) min = $7 } END { print min }' StudentsPerformance.csv)
echo "Najgorszy wynik z czytania dla dziewczat to: $girlsMinReadingScore"

girlsMaxReadingScore=$(awk -F $FS 'BEGIN { max = 0 } /female/ { if ( $7 > max ) max = $7 } END { print max }' StudentsPerformance.csv)
echo "Najlepszy wynik z czytania dla dziewczat to: $girlsMaxReadingScore"

girlsMinWritingScore=$(awk -F $FS 'BEGIN { min = 1000000 } /female/ { if ( $8 < min ) min = $8 } END { print min }' StudentsPerformance.csv)
echo "Najgorszy wynik z pisania dla dziewczat to: $girlsMinWritingScore"

girlsMaxWritingScore=$(awk -F $FS 'BEGIN { max = 0 } /female/ { if ( $8 > max ) max = $8 } END { print max }' StudentsPerformance.csv)
echo "Najlepszy wynik z pisania dla dziewczat to: $girlsMaxWritingScore"

boysOver100=$(awk -F $FS '/male/ && $1 !~ /female/ { if ( $6 == 100 || $7 == 100 || $8 == 0 ) bCounter++ } END { print bCounter }' StudentsPerformance.csv)
echo "Liczba chlopcow, ktorzy uzyskali wynik 100 wynosi: $boysOver100"
