class CreateClubRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :club_requests do |t|
      t.string :position
      t.integer :budget
      t.integer :salary
      t.text :description
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
