#!/usr/bin/env bash

# copy_mysql_database.sh
# This script copy a mysql database by making a dump
# to sql file, to later load that file in a new mysql database

# Source the copy_mysql_database_optparse file ---------------------------------------------------
source copy_mysql_database.sh_optparse

host=$host
user=$user
password=$password
olddb=$olddb
newdb=$newdb
mysqlconn="-h $host -u $user -p$password"

echo "$mysqlconn $olddb $newdb"
mysql $mysqlconn -e "CREATE DATABASE if not exists $newdb"
mysqldump $mysqlconn --verbose $olddb | mysql $mysqlconn --database $newdb



