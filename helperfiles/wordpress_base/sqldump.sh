#!/bin/sh

#----------------------------------------------------

# sh /tmp/helperfiles/wordpress_base/sqldump.sh

# (1) set up all the mysqldump variables
FILE=wordpress.sql #.`date +"%Y%m%d"`
FILECOMPRESSED=wordpress.sql.`date +"%Y%m%d"`
DBSERVER=127.0.0.1
DATABASE=wordpress
USER=root
PASS=root

# (2) in case you run this more than once a day, remove the previous version of the file
unalias rm     2> /dev/null
rm ${FILE}     2> /dev/null
rm ${FILE}.gz  2> /dev/null

# (3) do the mysql database backup (dump)

# use this command for a database server on a separate host:
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}

# use this command for a database server on localhost. add other options if need be.
mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}

# (4) gzip the mysql database dump file
gzip $FILE

# (5) show the user the result
echo "${FILE}.gz was created:"
ls -l ${FILE}.gz

mv ${FILE}.gz /var/www/public/wordpress_base
cp -f /var/www/public/wordpress_base/${FILE}.gz /var/www/public/wordpress_base/${FILECOMPRESSED}.gz