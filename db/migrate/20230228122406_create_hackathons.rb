class CreateHackathons < ActiveRecord::Migration[6.1]
  def change
    create_table :hackathons do |t|
      t.string :image_url
      # varchar is a string
      t.string :topic
      t.string :description
      t.string :location
      t.string :datetime
      # create two columns, for created_at, updated_at
      t.timestamps
    end
  end
end
