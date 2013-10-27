#
# Cookbook Name:: mineos
#
# Copyright 2013, ka’imi
#

default['mineos']['group'] = "mineos"
default['mineos']['basedir'] = "/srv/mineos"
default['mineos']['version'] = "master"

default['mineos']['profile_fix']['enable'] = true
default['mineos']['profile_fix']['versions'] = ["1.7.2"]

default['mineos']['service']['enable'] = true

default['mineos']['config']['basedir'] = "/var/games/minecraft"
default['mineos']['config']['locale'] = "en"
default['mineos']['config']['logfile'] = "/var/log/mineos.log"
default['mineos']['config']['host']['address'] = "0.0.0.0"
default['mineos']['config']['host']['port'] = 8080
default['mineos']['config']['ssl']['enable'] = "True"
default['mineos']['config']['ssl']['generate'] = true
default['mineos']['config']['ssl']['cert'] = "/etc/ssl/certs/mineos.crt"
default['mineos']['config']['ssl']['key'] = "/etc/ssl/certs/mineos.key"
default['mineos']['config']['ssl']['ca'] = ""
default['mineos']['config']['ssl']['chain'] = ""
