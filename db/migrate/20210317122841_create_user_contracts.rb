class CreateUserContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_contracts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :contract1
      t.string :contract2

      t.timestamps
    end
  end
end
