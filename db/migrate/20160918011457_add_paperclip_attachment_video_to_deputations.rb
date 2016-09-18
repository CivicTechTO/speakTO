class AddPaperclipAttachmentVideoToDeputations < ActiveRecord::Migration
  def self.up
    change_table :deputations do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :deputations, :video
  end
end
