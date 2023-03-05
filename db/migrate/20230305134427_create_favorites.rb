class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :senior_id
      t.integer :notice_id


      t.timestamps
    end
  end
end
