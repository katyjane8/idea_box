class Image < ApplicationRecord
  validates :name, :url, presence: true
  has_many :ideas

end
