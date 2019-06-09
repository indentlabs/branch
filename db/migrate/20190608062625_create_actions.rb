class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :title
      t.string :description
      t.integer :previous_chunk_id
      t.integer :next_chunk_id

      t.timestamps
    end
  end
end
