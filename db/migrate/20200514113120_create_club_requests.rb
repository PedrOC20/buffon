class CreateClubRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :club_requests do |t|
      t.string :position
      t.string :budget
      t.string :salary
      t.text :description
      t.references :club, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
