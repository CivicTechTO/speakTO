class CreateDeputationsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :deputations do |t|
      t.string :filename
      t.string :filepath
      t.string :filetype
    end
  end
end
