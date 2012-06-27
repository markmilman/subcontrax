# == Schema Information
#
# Table name: service_calls
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  notes                :string(255)
#  status               :integer
#  started_on           :datetime
#  customer_id          :integer
#  customer_contract_id :integer
#  completed_on         :datetime
#  settlement_date      :date
#  settlement_status    :string(255)
#  type                 :string(255)
#  bom_id               :integer
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#

class ServiceCall < ActiveRecord::Base
  attr_accessible :completed_on, :name, :notes, :settlement_date, :settlement_status, :started_on, :status, :type
  belongs_to :customer

end
