class AddUniqueIndexToSpots < ActiveRecord::Migration[7.1]
  def change
    add_index :spots, [:name, :latitude, :longitude, :place_id], unique: true
  end
end
