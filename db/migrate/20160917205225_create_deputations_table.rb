class CreateDeputationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :deputations do |t|
      t.string :file_name
      t.string :file_path
      t.string :file_type
      t.text :transcription
      t.timestamps
    end
  end
end
