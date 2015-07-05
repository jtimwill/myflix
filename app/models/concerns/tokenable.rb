module Tokenable 
  extend ActiveSupport::Concern

  def generate_token!
    update_column(:token, SecureRandom.urlsafe_base64)
  end

  def delete_token!
    update_column(:token, nil)
  end
end