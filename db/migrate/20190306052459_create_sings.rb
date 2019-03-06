class CreateSings < ActiveRecord::Migration[5.2]
  def change
    create_table :sings do |t|
      t.string :url
      t.string :result
      t.integer :song_id, index: true

      t.timestamps
    end
  end
end
