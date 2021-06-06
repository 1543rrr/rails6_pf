class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :fes_name,presence: true
  validates :impressions,  presence: true
  validates :image, presence: true
end
