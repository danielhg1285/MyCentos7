#!/bin/bash

project_path=${1:?}
pattern=${2:?}

find $project_path -type f | xargs grep -i $pattern
