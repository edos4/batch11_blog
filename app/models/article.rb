class Article < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  validates :body, presence: true

  has_many :comments
end
