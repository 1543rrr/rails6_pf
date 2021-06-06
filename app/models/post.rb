class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, foreign_key: :post_id, dependent: :destroy  
  validates :fes_name,presence: true
  validates :impressions,  presence: true
  validates :image, presence: true
end
