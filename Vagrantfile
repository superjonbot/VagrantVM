# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "superjonBOX"
    config.vm.box_check_update = false

    config.vm.network "private_network", ip: "192.168.42.42"
    config.vm.hostname = "superjonBOX"
    config.vm.synced_folder "/Users/jorobles/Sites/", "/var/www/public/", :mount_options=> ["dmode=777,fmode=666"]
    config.vm.synced_folder "./sites-enabled/", "/etc/apache2/sites-enabled/", :mount_options=> ["dmode=777,fmode=777"]
    #config.vm.synced_folder "./apache_conf/", "/etc/php5/apache2/conf.d/", :mount_options=> ["dmode=777,fmode=777"]
    config.vm.synced_folder "./helperfiles/", "/tmp/helperfiles", create: true, :owner=> 'root', :group=>'root', :mount_options=> ["dmode=777,fmode=777"]

   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
  
     # Customize the amount of memory on the VM:
     vb.memory = "1024"
   end

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.insert_key = false
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"  
  # fixes ==> default: stdin: is not a tty error

  #config.vm.provision "shell",
   # inline: "sudo /etc/init.d/apache2 restart", run: "always"


#end


config.vm.provision "shell", run: "always", inline: <<-SHELL

    sudo cp -f /tmp/helperfiles/wordpress_base/apache_conf/user.ini /etc/php5/apache2/conf.d/
    sudo cp -f /tmp/helperfiles/motd.tail /etc/
    sudo cp -f /etc/motd.tail /etc/motd
    #sudo cp -f /tmp/helperfiles/wordpress_base/sqldump.sh /etc/pm/sleep.d/
    #sudo apt-get -y update
    #sudo yum -y install httpd
    #sudo cp -r -f /tmp/helpers/http/* /var/www/html
    #sudo cp -f /tmp/helpers/misc/motd /etc
    #sudo cp -f /tmp/helpers/misc/boxprep.sh /etc
    #sudo cp -f /tmp/helpers/misc/selinuxconfig /etc/selinux
    #sudo mv /etc/selinux/selinuxconfig /etc/selinux/config
    #sudo chmod +x /etc/boxprep.sh
    #sudo yum -y install mysql-server
    #sudo yum -y install php php-mysql
    #sudo yum -y install php-mbstring
    #sudo yum -y install php-mcrypt*
    #sudo chkconfig --levels 235 httpd on
    #sudo chkconfig --levels 235 mysqld on
    #sudo mysqladmin -u root password 'vagrant'
    #sudo service httpd start
    #sudo service mysqld start
    #sudo service httpd restart
    #sudo yum -y install git
    


    echo "http://local.superjonbot.com/"
    echo "http://local.phpmyadmin.com/  root:root     create:wordpress & import sql"
    echo "sh /tmp/helperfiles/wordpress_base/sqldump.sh"
    echo "sh /tmp/helperfiles/wordpress_base/sqlrestore.sh"
    sudo /etc/init.d/apache2 restart

   SHELL

    #config.vm.provision "shell",
    #inline: "sudo /etc/init.d/apache2 restart", run: "always"
end




