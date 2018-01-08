#!/bin/bash
# A shell script to restore a large SQL dump using root login.
# Usage: ./restore_dump.sh dump.sql app_devdb
#
# Author: Michael de Silva (michael@mwdesilva.com / http://github.com/bsodmike)
#FILE=wordpress.sql.`date +"%Y%m%d"`

#/var/www/public/wordpress_base/wordpress.sql

DBSERVER=127.0.0.1
DATABASE=wordpress
USER=root
PASS=root
FILE=/var/www/public/wordpress_base/wordpress.sql

   db="${DATABASE}"
   echo "creating database ${DATABASE}"
   mysql -u ${USER} -p${PASS} -e "CREATE DATABASE IF NOT EXISTS ${DATABASE};"
   #mysql -h localhost -u ${USER} -p${PASS} mysql --password=${PASS} <<< "create database $db"
   echo "restoring database ${DATABASE}"
   #gunzip "$f"
   gzip -d /var/www/public/wordpress_base/wordpress.sql.gz

   mysql -h localhost -u ${USER} -p${PASS} ${DATABASE} < ${FILE}

#wordpress.sql.20161229.gz

#(( $# != 2 )) && { echo "Usage: $0 dump.sql database_name"; exit 1; }
#[ ! -f $1 ] && { echo "$1 not found1"; exit 1; }

#RESULT=`mysql -u root -p${PASS} --skip-column-names -e "SHOW DATABASES LIKE '${DATABASE}'"`
#if [ "$RESULT" != ${DATABASE} ]; then
#    echo "Database '${DATABASE}' does not exist; creating it...";
#    
#    [ $? -ne 0 ] && { echo "Unknown error in attempting to create database '${DATABASE}'"; exit 1; }
#fi

#(
#  echo "SET AUTOCOMMIT=0;"
#  echo "SET UNIQUE_CHECKS=0;"
#  echo "SET FOREIGN_KEY_CHECKS=0;"
#  cat $1
#  echo "SET FOREIGN_KEY_CHECKS=1;"
#  echo "SET UNIQUE_CHECKS=1;"
#  echo "SET AUTOCOMMIT=1;"
#  echo "COMMIT;"
#) | mysql -o -u root -p${PASS} "${DATABASE}"
