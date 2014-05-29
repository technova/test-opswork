package 'htop' do
  package_name 'htop'
  action :install
end
template "/etc/log_files.yml" do
  source "passenger.conf.erb"
  owner "root"
  group "root"
  mode "644"
end

template "/etc/apache2/mods-available/passenger.load" do
  source "passenger.load.erb"
  owner "root"
  group "root"
  mode "644"
end
