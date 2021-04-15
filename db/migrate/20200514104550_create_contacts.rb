class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :role
      t.string :importance
      t.text :description
      t.references :club, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :how_met
      t.string :where_met

      t.timestamps
    end
  end
end
