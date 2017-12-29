class Image < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "150x150#" },
                    storage: :s3,
                    s3_credentials: {
                      access_key_id: ENV["AWS_ACCESS_KEY_ID"],
                      secret_access_key: ENV["AWS_SECRET_KEY_ID"],
                      bucket: ENV["S3_BUCKET_NAME"]
                    },
                    s3_region: ENV["AWS_REGION"],
                    :default_url => "spec/fixtures/2.jpg"
  validates_attachment_content_type :image, content_type: { content_type: /\Aimage\/.*\Z/ }

  has_many :idea_images
  has_many :ideas, through: :idea_images
end
