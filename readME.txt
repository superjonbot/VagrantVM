1: place this directory in your User folder
2: make AE folder in your User/Sites Folder
2: edit your hosts so all your local domains point to 192.168.42.42
     ie. 
            192.168.42.42 local.appletv.aetndigital.com local-appletv.aetndigital.com
            192.168.42.42 local.chromecast.ott.aetnd.com local-chromecast.ott.aetnd.com
3: make a conf file for your domain to where it is in your AE (Sites) folder
4: vagrant up!



1. Used scotch box
2. Updated patchwork/utf8 - May not need to do this again
3. Created files at /public/trace.log and /public/feedUrl.log

cd /var/www/public/AE/aetn.ott.appletv/public/js
touch trace.log
touch feedUrl.log

4. Installed php-apcu: sudo apt-get install php-apc
5. May or may not have to turn on opcache in php.ini
6. Turned Off short tags in /etc/php5/php.d/user.ini