class AddContentToMicroposts < ActiveRecord::Migration[7.2]
  def change
    add_column :microposts, :content, :text
  end
end
