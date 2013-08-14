#
# Cookbook Name:: mineos
# Recipe:: default
#
# Copyright 2013, ka’imi
#

execute "java_license" do
  command "echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections"
end

ppa "ppa:webupd8team/java"

%w{ screen libxslt1.1 rsync rdiff-backup oracle-java7-installer oracle-java7-set-default }.each do |p|
  package p
end

directory "/usr/java"
link "/usr/java/java-latest" do
  to "/usr/lib/jvm/java-7-oracle/bin"
end

hiawatha_pkg = "hiawatha_9.2_amd64.deb"
remote_file "/root/#{hiawatha_pkg}" do
  source "http://files.tuxhelp.org/hiawatha/#{hiawatha_pkg}"
  action :create_if_missing
  notifies :install, "dpkg_package[#{hiawatha_pkg}]", :immediately
  notifies :start, "service[hiawatha]", :immediately
end

dpkg_package hiawatha_pkg do
  source "/root/#{hiawatha_pkg}"
  action :nothing
end

user "mc" do
  home "/home/mc"
end
directory "/home/mc" do
  owner "mc"
  group "mc"
end

directory "/usr/games/minecraft" do
  owner "mc"
  group "mc"
end

directory "/var/www/hiawatha/" do
  owner "mc"
  group "mc"
end
directory "/var/www/hiawatha/admin/" do
  owner "mc"
  group "mc"
end
directory "/var/www/hiawatha/admin/cgi-bin" do
  owner "mc"
  group "mc"
end

execute "rsync_webui" do
  command "rsync -r rsync://mineos@codeemo.com/stable_webui /var/www/hiawatha/admin"
  user "mc"
  group "mc"
end
execute "rsync_scripts" do
  command "rsync -r rsync://mineos@codeemo.com/stable_scripts /usr/games/minecraft/"
  user "mc"
  group "mc"
end

execute 'chmod +x /usr/games/minecraft/*.py'
execute 'chmod +x /usr/games/minecraft/*.sh'

link "/var/www/hiawatha/admin/cgi-bin/server.py" do
  to "/usr/games/minecraft/server.py"
end

remote_file "/etc/hiawatha/hiawatha.conf" do
  source "http://minecraft.codeemo.com/files/ubuntu/hiawatha.conf"
  notifies :restart, "service[hiawatha]"
end
service "hiawatha" do
  action :nothing
end

cron "backup_hourly" do
  minute "0"
  user "mc"
  command "cd /usr/games/minecraft; ./mineos_console.py crontab backup hourly"
end
cron "archive_hourly" do
  minute "0"
  user "mc"
  command "cd /usr/games/minecraft; ./mineos_console.py crontab archive hourly"
end

cron "backup_daily" do
  minute "0"
  hour "0"
  user "mc"
  command "cd /usr/games/minecraft; ./mineos_console.py crontab backup daily"
end
cron "archive_daily" do
  minute "0"
  hour "0"
  user "mc"
  command "cd /usr/games/minecraft; ./mineos_console.py crontab archive daily"
end

cron "backup_weekly" do
  minute "0"
  hour "0"
  weekday "0"
  user "mc"
  command "cd /usr/games/minecraft; ./mineos_console.py crontab backup weekly"
end
cron "archive_weekly" do
  minute "0"
  hour "0"
  weekday "0"
  user "mc"
  command "cd /usr/games/minecraft; ./mineos_console.py crontab archive weekly"
end
