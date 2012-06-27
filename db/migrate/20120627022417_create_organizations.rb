class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :telephone
      t.string :website
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :mobile
      t.string :work_phone
      t.string :email
      t.boolean :subcontrax_member
      t.integer :status

      t.timestamps
    end
  end
end
