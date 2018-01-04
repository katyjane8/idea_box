class Idea < ApplicationRecord
  has_attached_file :image
  validates :title, :body, presence: true
  belongs_to :category, optional: true
  belongs_to :user
  has_many :idea_images
  has_many :images, through: :idea_images
end
