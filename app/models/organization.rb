# == Schema Information
#
# Table name: organizations
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  telephone         :string(255)
#  website           :string(255)
#  company           :string(255)
#  address1          :string(255)
#  address2          :string(255)
#  city              :string(255)
#  state             :string(255)
#  zip               :string(255)
#  country           :string(255)
#  mobile            :string(255)
#  work_phone        :string(255)
#  email             :string(255)
#  subcontrax_member :boolean
#  status            :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

class Organization < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :company, :country, :email, :mobile, :name, :state, :status, :telephone, :website, :work_phone, :zip
  has_many :users
  has_many :customers

  has_and_belongs_to_many :roles

  validates_presence_of :name
end
