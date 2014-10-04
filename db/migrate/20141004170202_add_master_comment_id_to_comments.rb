class AddMasterCommentIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :master_comment_id, :integer
  end
end
