class AddPhoneNumberToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :phone_number, :string
  end
end
