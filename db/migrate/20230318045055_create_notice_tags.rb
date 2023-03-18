class CreateNoticeTags < ActiveRecord::Migration[6.1]
  def change
    create_table :notice_tags do |t|
      t.integer :notice_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
