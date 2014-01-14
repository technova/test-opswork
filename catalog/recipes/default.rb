#
# Cookbook Name:: catalog
# Recipe:: default
#
# Copyright 2014, Saviance
#
# All rights reserved - Do Not Redistribute
#
bash "updates packages" do
	code "apt-get update"
end


 
# apt-get install git
package "git"
package "subversion"
package "imagemagick"
package "libmagickwand-dev"
user "deploy" do
    action :create
    comment "deploy user"
    uid next_free_uid
    gid 'www-data'
    home "/home/deploy"
    supports :manage_home => true
    shell '/bin/bash'
    not_if do
      existing_usernames = []
      Etc.passwd {|user| existing_usernames << user['name']}
      existing_usernames.include?("deploy")
    end
end

# # Use apache.conf.erb with my attributes and variables to create the file below with correct permissions.
# template "/etc/apache2/apache2.conf" do
# source "apache2.conf.erb"
# owner "root"
# group "root"
# mode "644"
# end

# template "/etc/apache2/mods-available/passenger.conf" do
# source "passenger.conf.erb"
# owner "root"
# group "root"
# mode "644"
# end

# template "/etc/apache2/mods-available/passenger.load" do
# source "passenger.load.erb"
# owner "root"
# group "root"
# mode "644"
# end
 
# # Starts apache.
# # Configures apache to start at boot.
# service "apache2" do
#   supports :restart => true, :reload => true
#   action :enable
# end
include_recipe "apache2"
include_recipe "apache2::mod_deflate"
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

# include_recipe 'ruby_enterprise'
# include_recipe "passenger_apache2"
# include_recipe "passenger_apache2::mod_rails"