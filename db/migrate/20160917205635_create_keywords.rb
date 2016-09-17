class CreateKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :keywords do |t|
      t.integer :deputation_id
      t.string :text
      t.float :relevance
      t.string :sentiment
      t.float :sentiment_strength
      t.timestamps
    end
  end
end
