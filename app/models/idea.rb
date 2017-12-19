class Idea < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :category
  belongs_to :user

end
