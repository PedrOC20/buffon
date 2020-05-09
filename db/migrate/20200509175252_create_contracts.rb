class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.references :player, null: false, foreign_key: true
      t.string :title
      t.string :file

      t.timestamps
    end
  end
end
