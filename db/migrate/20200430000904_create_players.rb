class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :birth_date
      t.string :birthplace
      t.integer :age
      t.string :height
      t.string :nacionality
      t.string :position
      t.string :foot
      t.string :manager
      t.string :current_club
      t.string :in_team_since
      t.string :contract_until
      t.string :equipment
      t.string :social
      t.string :player_url
      t.string :photo
      t.string :player_type
      t.string :full_name
      t.string :tax_number
      t.string :address
      t.string :passport_number
      t.string :email
      t.string :weight
      t.string :position_2
      t.string :position_3
      t.string :internal_agent
      t.string :agent_contract_expires
      t.string :sponsor
      t.string :phone_number
      
      t.timestamps
    end
  end
end
