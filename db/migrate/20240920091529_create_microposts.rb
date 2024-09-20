class CreateMicroposts < ActiveRecord::Migration[7.2]
  def change
    create_table :microposts do |t|
      t.timestamps
    end
  end
end
