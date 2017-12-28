class Image < ApplicationRecord
  has_attached_file :image, :storage => :cloudinary, styles: { medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: { content_type: /\Aimage\/.*\Z/ }

  has_many :idea_images
  has_many :ideas, through: :idea_images

  def self.all_pics
    
  end
end
