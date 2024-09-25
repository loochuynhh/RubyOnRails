class DropMicroposts < ActiveRecord::Migration[7.2]
  def up
    drop_table :microposts if table_exists?(:microposts)
  end

  def down
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
