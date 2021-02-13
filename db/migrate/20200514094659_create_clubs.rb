class CreateClubs < ActiveRecord::Migration[6.0]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :logo
      t.date :founded
      t.string :address
      t.string :email
      t.string :president
      t.string :website
      t.integer :phone_number
      t.string :club_url

      t.timestamps
    end
  end
end
