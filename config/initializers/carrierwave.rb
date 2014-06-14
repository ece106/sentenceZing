CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AWS_KEY',   
    :aws_secret_access_key  => 'AWS_SECRET_KEY',   
#    :aws_access_key_id      => 'AWS_KEY',                # required
#    :aws_secret_access_key  => 'AWS_SECRET_KEY',       # required
    :region                 => 'us-east-1'                  # optional, defaults to 'us-east-1'
  }
  config.permissions = 0777
  config.fog_directory  = 'SentenceZing'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end