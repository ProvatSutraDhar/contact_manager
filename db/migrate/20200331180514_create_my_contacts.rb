class CreateMyContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :my_contacts do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :phone
      t.string :address
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
