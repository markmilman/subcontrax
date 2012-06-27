class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :telephone
      t.integer :owner_id
      t.integer :organization_id
      t.string :company
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :mobile_phone
      t.string :work_phone
      t.string :email
      t.integer :billing_status

      t.timestamps
    end
  end
end
