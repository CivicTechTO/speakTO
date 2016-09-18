class CreateDeputationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :deputations do |t|
      t.string :first_name
      t.string :last_name
      t.string :postal_code
      t.text :transcription
      t.timestamps
    end
  end
end
