class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :image_url
      t.string :model
      t.string :speed
      t.string :datetime
      t.timestamps        
      end
    end
end
