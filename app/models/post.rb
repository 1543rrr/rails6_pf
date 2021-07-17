class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id, dependent: :destroy

  def self.search(search)
    if search != ""
      Post.where('fes_name LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  validates :fes_name,presence: true, length: { maximum: 10 }
  validates :impressions,  presence: true, length: { maximum: 45 }
  validates :image, presence: true

end
