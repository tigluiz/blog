class Comment < ActiveRecord::Base
  belongs_to :article
  validates :description, presence: true

  has_many :child_comments, :class_name => "Comment", :foreign_key => "master_comment_id"
  belongs_to :master_comment, :class_name => "Comment"

  before_save :check_black_list
  self.per_page = 4

  def has_child?
    child_comments.size > 0
  end

  private
  def check_black_list
    self.description = BlackList.execute description
  end

end
