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
  application "#{application}" do
    path "/srv/www/#{application}"
    owner 'deploy'
    group 'www-data'
    scm_provider Chef::Provider::Subversion
    repository repository
    revision   revision
    environment_name rails_env
    rails do
      bundler_deployment true
      # bundle_options "2>&1 | tee -a /var/log/bundle-out.log"
      database do
        host host
        adapter adapter
        database database
        username username
        password password
        reconnect reconnect
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
      #server_aliases deploy[:domains]
      #webapp_template "#{application}.conf.erb"
    end
  end
end