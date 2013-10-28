# CHANGELOG for mineos

This file is used to list changes made in each version of mineos.

## 2.0.1

* fixed: directory `/var/games/minecraft` missing on first run of ::default
* fixed: typos in README & CHANGELOG

## 2.0.0

* \[[#1](https://github.com/kaimi/chef-mineos/issues/1)\] upgrade to 
  [mineos](https://github.com/hexparrot/mineos) 0.6.0
* removed dependency on apt-repo cookbook
* added dependency on logrotate cookbook
* switched from sun java to openjdk (as recommended by mineos)
* added a metric ton of attributes and configurability
* now uses chef’s `deploy_revision` to install from git
* added baseline profile for minecraft 1.7.2 to mineos 0.6

__CAUTION__: This version is basically a rewrite from scratch. It __breaks 
compatibility__, hence the major version bump. If you are upgrading from 
1.0, please follow the instructions in the README.

## 1.0.1

* fixed deprecated dependencies
* updated README

## 1.0.0

* Initial release of mineos
