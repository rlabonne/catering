class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :firstName
      t.string :lastName
      t.string :company
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
