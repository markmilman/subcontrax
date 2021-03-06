class CreateServiceCalls < ActiveRecord::Migration
  def change
    create_table :service_calls do |t|
      t.string :name
      t.string :notes
      t.integer :status
      t.datetime :started_on
      t.integer :customer_id
      t.integer :customer_contract_id
      t.string :status
      t.datetime :completed_on
      t.date :settlement_date
      t.string :settlement_status
      t.string :type
      t.integer :bom_id

      t.timestamps
    end
  end
end
