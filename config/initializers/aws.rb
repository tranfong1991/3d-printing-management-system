require 'aws-sdk'

Aws.config.update({
  region: 'us-west-2',
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  ssl_verify_peer: false
})