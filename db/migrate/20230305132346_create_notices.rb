class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :senior_id, null: false
      t.integer :genre_id, null:false
      t.string :title, null: false
      t.text :body, null: false, default: ""
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.string :place, null: false, default: ""
      t.float :rate
      t.timestamps
    end
  end
end
