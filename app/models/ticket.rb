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

class Ticket < ActiveRecord::Base
  attr_accessible :completed_on,
                  :description,
                  :name,
                  :settlement_date,
                  :settlement_status,
                  :started_on,
                  :status,
                  :type

  attr_accessor :destroyed
  after_destroy :mark_as_destroyed

  def self.select_options
    descendants.map { |c| c.to_s }.sort
  end

  def self.inherited(child)
    child.instance_eval do
      def model_name
        Ticket.model_name
      end
    end
    super
  end

  @child_classes = []

  def self.inherited(child)
    @child_classes << child
    super # important!
  end

  def self.child_classes
    @child_classes
  end

  def mark_as_destroyed
    self.destroyed = true
  end


  def self.select_options
    descendants.map { |c| c.to_s }.sort
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

end
