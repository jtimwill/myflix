CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :aws
    config.fog_credentials = {
      provider:              ENV['PROVIDER'],
      aws_access_key_id:     ENV['AWS_ACCESS_KEY'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    }
    config.aws_bucket  = ENV['S3_BUCKET_NAME']
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end
