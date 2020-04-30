class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.date :birth_date
      t.string :birthplace
      t.integer :age
      t.integer :height
      t.string :nacionality
      t.string :position
      t.string :foot
      t.string :manager
      t.string :current_club
      t.date :in_team_since
      t.date :contract_until
      t.string :equipment
      t.string :social
      
      t.timestamps
    end
  end
end
