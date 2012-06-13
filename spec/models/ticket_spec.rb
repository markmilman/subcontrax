# == Schema Information
#
# Table name: tickets
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  description          :string(255)
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

require 'spec_helper'

describe Ticket do
  pending "add some examples to (or delete) #{__FILE__}"
end
