class Ticket < ActiveRecord::Base
  attr_accessible :bom_id, :completed_on, :customer_contract_id, :customer_id, :description, :name, :settlement_date, :settlement_status, :started_on, :status, :status, :type
end
