class AddIndexAndConstraintsToMicroposts < ActiveRecord::Migration[7.2]
  def change
    add_index :microposts, [:user_id, :created_at]

    change_column_null :microposts, :user_id, false
    change_column_null :microposts, :content, false
  end
end
