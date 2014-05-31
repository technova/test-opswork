Chef::Log.info "Running bluepill..."
# this code is not working...
#
# include_recipe "deploy"
directory = "/srv/www/goldappnew/current"
commands = ["sudo bundle exec bluepill stop", "sudo bundle exec bluepill load ./config/dj_bluepill.pill", "sudo bundle exec bluepill start"]
commands.each do |command|
  execute "restart bluepill, running #{command}" do
    cwd directory
    command command
    action :run    
    # only_if do 
    #   File.exists?(deploy[:current_path])
    # end
  end    
end