class CreateConcepts < ActiveRecord::Migration[5.0]
  def change
    create_table :concepts do |t|
      t.integer :deputation_id
      t.string :text
      t.float :relevance
      t.timestamps
    end
  end
end
