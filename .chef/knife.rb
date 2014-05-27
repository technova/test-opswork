# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "sonirajesh"
client_key               "#{current_dir}/sonirajesh.pem"
validation_client_name   "technova_-validator"
validation_key           "#{current_dir}/technova_-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/technova_"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:aws_access_key_id] = "AKIAIRNMDI7YMT2VVS3Q"
knife[:aws_secret_access_key] = "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"
knife[:availability_zone]     = 'us-east-1a'
knife[:region]                = 'us-east-1'
knife[:ssh_user]                = 'ubuntu'
knife[:image]                = 'ami-018c9568'
knife[:identity_file]                = '~/Documents/pk/us-east.pem'
knife[:aws_ssh_key_id]                = 'us-east'
knife[:flavor] = 'm1.small'
knife[:price] = '0.008'
knife[:spot_price] = '0.008'