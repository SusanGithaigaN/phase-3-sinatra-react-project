class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :phonenumber
      t.string :idnumber
      t.string :address
      t.timestamps
    end
    
  end
end
