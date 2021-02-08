#!/bin/bash

# Posible convitations
# Example:
# change_project_pattern.sh /home/danyboy/mbc-palm palm face
# change_project_pattern.sh /home/danyboy/mbc-palm Palm Face
# change_project_pattern.sh /home/danyboy/mbc-palm PALM FACE

project_path=${1:?}
pattern=${2:?}
newpattern=${3:?}

rename_file_names() {
   find "$project_path" -depth -name "*$pattern*" | \
   while read file; do
      newFile=$(sed "s/\(.*\)$pattern/\1$newpattern/" <<< $file)
      mv $file $newFile
   done
}

rename_pattern_on_files() {
   find "$project_path" -type f | xargs grep -l "$pattern" | \
   while read file; do
      sed -i -e "s/$pattern/$newpattern/g" $file
   done
}

# Rename project file names from one pattern to new pattern
rename_file_names
# Rename project pattern to new pattern on files
rename_pattern_on_files
