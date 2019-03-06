class AddColumnResult2ToSings < ActiveRecord::Migration[5.2]
  def change
    add_column :sings, :result_2, :string, limit: 2048
  end
end
