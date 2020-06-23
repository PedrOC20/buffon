class RemoveHeightFromPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :height
  end
end
