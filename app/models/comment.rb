class Comment < ActiveRecord::Base
  belongs_to :article
  validates :description, presence: true
end
