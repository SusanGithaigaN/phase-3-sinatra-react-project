class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :contactnumber
      t.string :nationalid
      t.integer :car_id
    end
  end
end
