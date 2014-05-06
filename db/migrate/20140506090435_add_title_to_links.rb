class AddTitleToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :title, :string
  	add_column :links, :content, :string
  	add_column :links, :thumbnail, :string
  end
end
