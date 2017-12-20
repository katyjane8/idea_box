class Image < ApplicationRecord
  validates :name, :url, presence: true
  has_many :ideas, through: :idea_images

  has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
