class AddAttachmentVideoToDeputations < ActiveRecord::Migration
  def self.up
    change_table :deputations do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :deputations, :video
  end

  def change
    create_table :videos do |t|
      t.string :video_file_name
      t.string :video_content_type
      t.integer :video_file_size
      t.datetime :video_updated_at

      t.timestamps
    end
  end
end
