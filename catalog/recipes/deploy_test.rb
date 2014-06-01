package 'htop' do
  package_name 'htop'
  action :install
end
execute "gem install remote_syslog --no-ri --no-rdoc" do
  action :run
end
template "/etc/log_files.yml" do
  source "log_files.yml.erb"
  owner "root"
  group "root"
  mode "644"
end

template "/etc/init.d/remote_syslog" do
  source "remote_syslog.erb"
  owner "root"
  group "root"
  mode "755"
end

service "remote_syslog" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end

execute "remote_syslog -c /etc/log_files.yml --tls -p 32120" do
  action :run
end