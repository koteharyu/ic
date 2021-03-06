class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy

  validates :body, presence: true, length: { maximum: 1000 }
end
