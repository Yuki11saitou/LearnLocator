class CreateSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :spots do |t|

      t.timestamps
    end
  end
end
