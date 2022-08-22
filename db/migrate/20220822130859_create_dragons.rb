class CreateDragons < ActiveRecord::Migration[7.0]
  def change
    create_table :dragons do |t|
      t.string :name
      t.string :power
      t.integer :age
      t.integer :level
      t.integer :price

      t.timestamps
    end
  end
end
