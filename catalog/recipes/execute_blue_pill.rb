Chef::Log.info "Running bluepill..."
# this code is not working...
command = "sudo bundle exec bluepill stop && sudo bundle exec bluepill load ./config/dj_bluepill.pill && sudo bundle exec bluepill start"
execute command do
  cwd "/srv/www/goldappnew"
  user 'root'
end