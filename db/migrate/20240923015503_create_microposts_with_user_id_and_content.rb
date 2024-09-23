class CreateMicropostsWithUserIdAndContent < ActiveRecord::Migration[7.2]
  def change
    create_table :microposts do |t|
      t.integer :user_id, null: false 
      t.text :content, null: false 
      t.timestamps
    end
  end
end
