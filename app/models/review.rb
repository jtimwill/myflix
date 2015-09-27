class Review < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  index_name ["myflix", Rails.env].join('_')
  belongs_to :video
  belongs_to :user
  validates_presence_of :content, :rating
end
