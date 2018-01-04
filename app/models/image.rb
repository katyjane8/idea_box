class Image < ApplicationRecord
<<<<<<< HEAD
  has_attached_file :image,
                    # :storage => :s3,
                    # :s3_credentials => "#{::Rails.root}/config/s3.yml",
                    # :s3_permissions => "public-read",
                    # :path => ":filename",
                    # :bucket => 'idea-box-kjw',
                    #
                    # :default_url => "spec/fixtures/2.jpg",
                    styles: { medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :image, content_type: { content_type: /\Aimage\/.*\Z/ }
=======
  has_attached_file :url, styles: { medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :url, content_type: /\Aimage\/.*\z/
>>>>>>> links_enhancements

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
