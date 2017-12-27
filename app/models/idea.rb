class Idea < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :category, optional: true
  belongs_to :user
  has_many :idea_images
  has_many :images, through: :idea_images
  has_attached_file :image
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
