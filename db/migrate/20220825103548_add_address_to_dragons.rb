class AddAddressToDragons < ActiveRecord::Migration[7.0]
  def change
    add_column :dragons, :address, :string
  end
end
