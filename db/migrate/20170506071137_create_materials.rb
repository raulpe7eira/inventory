class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
