class AddUserIdToMicroposts < ActiveRecord::Migration[7.2]
  def change
    add_column :microposts, :user_id, :integer
  end
end
