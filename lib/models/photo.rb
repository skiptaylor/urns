CarrierWave.configure do |config|
  config.fog_credentials = {
    aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
        aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
                 provider: ENV.fetch('PROVIDER')
  }
  config.fog_directory  = ENV.fetch('FOG_DIRECTORY')
end

class Uploader < CarrierWave::Uploader::Base
  storage :fog
end

class Photo < Sequel::Model
  plugin :timestamps

  many_to_one :product
  many_to_one :fader
  many_to_one :logo

  mount_uploader :source, Uploader
end
