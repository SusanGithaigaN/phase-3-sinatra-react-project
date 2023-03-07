class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name
      t.string :contactnumber
      # t.string :nationalid
      t.integer :car_id
      t.string :car_model
      # user authentication
      t.string :email
      t.string :password_digest
    end
  end
end
