#!/bin/bash

function zamień(){
	searchTerm=$1
	substitute=$2
	while IFS= read -r input; do
		echo "${input//$searchTerm/$substitute}"
	done
}

zamień $1 $2
