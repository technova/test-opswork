#
# Cookbook Name:: catalog
# Recipe:: deploy_app
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#create user


node["deploy"].each do |application, deploy|
  application "#{application}" do
    path "/srv/www/#{application}"
    owner 'deploy'
    group 'www-data'
    scm_provider Chef::Provider::Subversion
    repository deploy["scm"]["repository"]
    revision   deploy["scm"]["revision"]
    environment_name deploy["rails_env"]
    rails do
      bundler_deployment true
      # bundle_options "2>&1 | tee -a /var/log/bundle-out.log"
      database do
        host deploy["database"]["host"]
        adapter deploy["database"]["adapter"]
        database deploy["database"]["database"]
        username deploy["database"]["username"]
        password deploy["database"]["password"]
        reconnect deploy["database"]["reconnect"]
      end
      # database_master_role "redmine_database_master"
    end

    # memcached do
    #   role "memcached_master"
    #   options do
    #     ttl 1800
    #     memory 256
    #   end
    # end

    passenger_apache2 do
      server_aliases deploy["domains"]
      webapp_template "#{application}.conf.erb"
    end
  end
end