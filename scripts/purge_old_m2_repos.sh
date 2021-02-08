#!/bin/bash

# purge_old_m2_repos.sh
# This script liberate free space in /home/tfsbuild/.m2/repository/cu/datys/
# Its path is /usr/local/bin/purge_old_repos.sh
# The cron configuration file is /var/spool/cron/root
#
# AUTHOR
#   Written by Daniel Hernández

find_repo-test() {
  find /home/tfsbuild/.m2/repository/cu/datys/repo-test/ -maxdepth 1 -type d -name 1.0.2\* | sort
}

find_repo-test-1.1() {
  find /home/tfsbuild/.m2/repository/cu/datys/repo-test/ -maxdepth 1 -type d -name 1.1.2\* | sort
}


latest() {
  tail -n 3
}

but() {
  comm -3 - /tmp/latest
}

remove() {
  xargs rm -rf
}

find_repo-test | latest > /tmp/latest
find_repo-test | but | remove
find_repo-test-1.1 | latest > /tmp/latest
find_repo-test-1.1 | but | remove

