class CreateHires < ActiveRecord::Migration[6.1]
  def change
    create_table :hires do |t|
    t.integer :user_id
    t.integer :car_id
    t.date :loan_date
    t.date :return_date
    # t.integer :hire_period
    t.string :payment
    t.timestamps
    end
  end
end
