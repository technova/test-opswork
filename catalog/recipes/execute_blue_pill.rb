Chef::Log.info "Running bluepill..."
# this code is not working...
@command = "sudo bundle exec bluepill stop && sudo bundle exec bluepill load ./config/dj_bluepill.pill && sudo bundle exec bluepill start"

# include_recipe "deploy"

#node[:deploy].each do |application, deploy|
  execute "restart bluepill" do
    cwd "/srv/www/goldappnew/current"
    command @command
    action :run    
    # only_if do 
    #   File.exists?(deploy[:current_path])
    # end
  end    
#end