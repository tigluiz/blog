class Article < ActiveRecord::Base
  validates :description, presence: true
  has_many :comments
  accepts_nested_attributes_for :comments
  before_save :check_black_list

  private
  def check_black_list
    self.description = BlackList.execute description
  end
end
