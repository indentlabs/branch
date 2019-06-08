class CreateChunks < ActiveRecord::Migration[5.2]
  def change
    create_table :chunks do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.string :background_color
      t.datetime :published_at

      t.timestamps
    end
  end
end
