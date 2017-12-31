class Idea < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: { content_type: /\Aimage\/.*\Z/ }
  validates :title, :body, presence: true
  belongs_to :category, optional: true
  belongs_to :user
  has_many :idea_images
  has_many :images, through: :idea_images
end
