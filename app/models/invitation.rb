class Invitation < ActiveRecord::Base
  include Tokenable
  after_create :generate_token!
  belongs_to :inviter, class_name: "User"
  validates_presence_of :recipient_name, :recipient_email, :message
end