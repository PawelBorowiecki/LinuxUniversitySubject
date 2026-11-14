#!/bin/bash

sed -i "s/female/0/;s/male/1/" StudentsPerformance.csv

sed -i "s/none/0/" StudentsPerformance.csv

sed -i "s/group E/E/;s/group D/D/;s/group C/C/;s/group B/B/;s/group A/A/" StudentsPerformance.csv
