class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.references :player, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :ball_control
      t.integer :passing
      t.integer :dribling
      t.integer :heading
      t.integer :finishing
      t.integer :attack
      t.integer :defense
      t.integer :endurance
      t.integer :speed
      t.integer :agility
      t.integer :strength
      t.integer :drive
      t.integer :aggressiveness
      t.integer :determination
      t.integer :responsability
      t.integer :leadership
      t.integer :self_confidence
      t.integer :mental_toughness
      t.integer :coachability
      t.integer :set_pieces

      t.timestamps
    end
  end
end
