class Pic < ApplicationRecord
  acts_as_votable
  belongs_to :user 

  has_one_attached :picture do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
  # validates :picture, content_type: /\Aimage\/.*\z/
end
