class DropMicroposts < ActiveRecord::Migration[7.2]
  def up
    drop_table :microposts if table_exists?(:microposts)
  end

  def down
    create_table :microposts do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
