class CreateMigrationReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
        t.string :review
        t.integer :user_id
        t.integer :car_id
        t.integer :owner_id
        t.timestamps
    end
    
  end
end
