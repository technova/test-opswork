Chef::Log.info "Running bluepill..."
# this code is not working...
#
# include_recipe "deploy"
# directory = "/srv/www/goldappnew/current"
commands = ["sudo bundle exec bluepill stop", "sudo bundle exec bluepill load ./config/dj_bluepill.pill", "sudo bundle exec bluepill start"]
node[:deploy].each do |app, deploy|
  commands.each do |command|
    execute "restart bluepill, running #{command}" do
      cwd "#{node[:deploy][app][:deploy_to]}/current"
      command command
      action :run
      not_if "ps awux | grep rake"
    end
  end
end
