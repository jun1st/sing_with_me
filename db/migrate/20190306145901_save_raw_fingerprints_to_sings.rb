class SaveRawFingerprintsToSings < ActiveRecord::Migration[5.2]
  def change
  	add_column :sings, :raw_result, :string, limit: 2048
  	add_column :sings, :raw_result_2, :string, limit: 2048
  end
end
