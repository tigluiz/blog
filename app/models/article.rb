class Article < ActiveRecord::Base
  validates :description, presence: true
  has_many :comments
  accepts_nested_attributes_for :comments
  paginates_per 5
end
