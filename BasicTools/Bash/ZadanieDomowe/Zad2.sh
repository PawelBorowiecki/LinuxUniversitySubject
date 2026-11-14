#!/bin/bash

lscpu > informacjeOSystemie.txt
uname -a >> informacjeOSystemie.txt
echo $USER >> informacjeOSystemie.txt
echo $HOME >> informacjeOSystemie.txt
