class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.integer :senior_id, null: false, default: ""
      t.integer :genre_id, null:false, default: ""
      t.string :title, null: false, default: ""
      t.text :body, null: false, default: ""
      t.datetime :start_datetime, null: false, default: ""
      t.datetime :end_datetime, null: false, default: ""
      t.string :place, null: false, default: ""
      t.float :rate
      t.timestamps
    end
  end
end
