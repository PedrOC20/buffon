class AddFieldsToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :player_url, :string
    add_column :players, :photo, :string
    add_column :players, :player_type, :string
    add_column :players, :full_name, :string
    add_column :players, :tax_number, :string
    add_column :players, :address, :string
    add_column :players, :passport_number, :string
    add_column :players, :email, :string
    add_column :players, :weight, :string
    add_column :players, :position_2, :string
    add_column :players, :position_3, :string
    add_column :players, :internal_agent, :string
    add_column :players, :agent_contract_expires, :string
    add_column :players, :sponsor, :string
  end
end
