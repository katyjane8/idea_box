class Image < ApplicationRecord
  has_attached_file :url, styles: { medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :url, content_type: /\Aimage\/.*\z/

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
