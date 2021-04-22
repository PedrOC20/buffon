class AddProtectedToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :protected, :boolean
  end
end
