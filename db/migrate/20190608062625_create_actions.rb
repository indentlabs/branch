class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :title
      t.string :description
      t.references :previous_chunk, foreign_key: true
      t.references :next_chunk, foreign_key: true

      t.timestamps
    end
  end
end
