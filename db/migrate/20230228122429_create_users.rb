class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fullname 
      t.string :email
      # to avoid truncation if number starts with a 0??if i
      t.string :phonenumber
      t.string :language
      t.string :roles
      t.timestamps
    end
  end
end
