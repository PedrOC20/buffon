class AddPlayerIdToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_reference :evaluations, :player, null: false, foreign_key: true
  end
end
