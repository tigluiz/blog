class Comment < ActiveRecord::Base
  belongs_to :article
  validates :description, presence: true

  has_many :child_comments, :class_name => "Comment", :foreign_key => "master_comment_id"
  belongs_to :master_comment, :class_name => "Comment"

  def has_child?
    child_comments.size > 0
  end

end
