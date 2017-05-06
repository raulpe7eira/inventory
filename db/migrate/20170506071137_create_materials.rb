class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.text :description
      t.integer :amount

      t.timestamps
    end
  end
end
