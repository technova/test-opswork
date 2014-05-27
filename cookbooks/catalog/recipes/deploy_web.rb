git "/var/www/html" do
  repository "https://github.com/brunobuccolo/detroit-example.git"
  revision "production"
  action :sync
  user "root"
  group "root"
end