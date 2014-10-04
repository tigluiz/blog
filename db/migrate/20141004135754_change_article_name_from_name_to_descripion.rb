class ChangeArticleNameFromNameToDescripion < ActiveRecord::Migration
  def change
    rename_column :articles, :name, :description
  end
end
