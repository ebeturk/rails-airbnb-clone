class AddCoordinatesToDragons < ActiveRecord::Migration[7.0]
  def change
    add_column :dragons, :latitude, :float
    add_column :dragons, :longitude, :float
  end
end
