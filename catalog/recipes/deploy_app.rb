<<<<<<< HEAD
application="goldappnew"
reconnect = true
host = "testrdsnew.c5x3ackbzbcn.ap-southeast-1.rds.amazonaws.com"
password = "m3tn4bm6rg"
adapter = "mysql"
username = "root"
database = "iima_dev_migration_development"
repository = "svn://61.16.234.115/gold/branches/gold1.2.2"
user = "shreya"
password = "saviance"
revision = "HEAD"
rails_env = "iima_ops"
node[:deploy].each do |application, deploy|
=======
node["deploy"].each do |application, deploy|
>>>>>>> e9eb0983a18fb8c3a67a21382669319c948a11da
  application "#{application}" do
    path "/srv/www/#{application}"
    owner 'deploy'
    group 'www-data'
    scm_provider Chef::Provider::Subversion
<<<<<<< HEAD
    repository repository
    revision   revision
    environment_name rails_env
=======
    repository deploy["scm"]["repository"]
    revision   deploy["scm"]["revision"]
    environment_name deploy["rails_env"]
>>>>>>> e9eb0983a18fb8c3a67a21382669319c948a11da
    rails do
      bundler_deployment true
      # bundle_options "2>&1 | tee -a /var/log/bundle-out.log"
      database do
<<<<<<< HEAD
        host host
        adapter adapter
        database database
        username username
        password password
        reconnect reconnect
=======
        host deploy["database"]["host"]
        adapter deploy["database"]["adapter"]
        database deploy["database"]["database"]
        username deploy["database"]["username"]
        password deploy["database"]["password"]
        reconnect deploy["database"]["reconnect"]
>>>>>>> e9eb0983a18fb8c3a67a21382669319c948a11da
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
<<<<<<< HEAD
      #server_aliases deploy[:domains]
      #webapp_template "#{application}.conf.erb"
=======
      server_aliases deploy["domains"]
      webapp_template "#{application}.conf.erb"
>>>>>>> e9eb0983a18fb8c3a67a21382669319c948a11da
    end
  end
end
