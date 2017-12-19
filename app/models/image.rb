class Image < ApplicationRecord
  validates :title, presence: true
  has_many :ideas

end
