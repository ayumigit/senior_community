class CreateNoticeComment2s < ActiveRecord::Migration[6.1]
  def change
    create_table :notice_comment2s do |t|
      t.text :comment
      t.integer :senior_id
      t.integer :notice_id
      t.float :rate

      t.timestamps
    end
  end
end
