class Ticket < ActiveRecord::Base
  attr_accessible :bom_id, :completed_on, :customer_contract_id, :customer_id, :description, :name, :settlement_date, :settlement_status, :started_on, :status, :status, :type


  def self.select_options
    descendants.map { |c| c.to_s }.sort
  end
end
