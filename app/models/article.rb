class Article < ActiveRecord::Base
  validates :description, presence: true
end
