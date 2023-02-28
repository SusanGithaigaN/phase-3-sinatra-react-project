class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
        t.integer :user_id
        t.integer :hackerthon_id
        t.timestamps
    end
  end
end
