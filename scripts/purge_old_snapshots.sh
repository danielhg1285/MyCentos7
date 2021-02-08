#!/bin/bash
# This script make free space in /var/cache/mirror
# Its path is /usr/local/bin/purge_old_snapshots.sh
# The cron configuration file is /var/spool/cron/root


find_test2.10-core() {
  find -maxdepth 1 -type d -name test2.10-core\* | sort
}

find_test2.20-core() {
  find -maxdepth 1 -type d -name test2.20-core\* | sort
}

find_test3.0-core() {
  find -maxdepth 1 -type d -name test3.0-core\* | sort
}

find_doc() {
  find -maxdepth 1 -type d -name  doc-\* | sort
}

find_test-doc-die() {
  find -maxdepth 1 -type d -name  test-doc-die\* | sort
}

find_test-doc-dir() {
  find -maxdepth 1 -type d -name  test-doc-dir\* | sort
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

cd /var/cache/mirror

find_test2.10-core | latest > /tmp/latest
find_test2.10-core | but | remove

find_test2.20-core | latest > /tmp/latest
find_test2.20-core | but | remove

find_test3.0-core | latest > /tmp/latest
find_test3.0-core | but | remove

find_test-doc-die | latest > /tmp/latest
find_test-doc-die | but | remove

find_test-doc-dir | latest > /tmp/latest
find_test-doc-dir | but | remove
