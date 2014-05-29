Chef::Log.info "Running bluepill..."
command = "sudo bundle exec bluepill stop && sudo bundle exec bluepill load ./config/dj_bluepill.pill && sudo bundle exec bluepill start"
execute command do
  cwd "/srv/www/goldappnew"
  user 'deploy'
end