# == Schema Information
#
# Table name: customers
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  telephone       :string(255)
#  owner_id        :integer
#  organization_id :integer
#  company         :string(255)
#  address1        :string(255)
#  address2        :string(255)
#  city            :string(255)
#  state           :string(255)
#  zip             :integer
#  country         :string(255)
#  phone           :string(255)
#  mobile_phone    :string(255)
#  work_phone      :string(255)
#  email           :string(255)
#  billing_status  :integer
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class Customer < ActiveRecord::Base
  attr_accessible :address1, :address2, :billing_status, :city, :company, :country, :email, :mobile_phone, :name, :phone, :state, :telephone, :work_phone, :zip
  belongs_to :owner, foreign_key: 'owner_id', class: 'Organization'
  has_one :organization
  has_many :service_calls
end
