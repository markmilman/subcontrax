class Ticket < ActiveRecord::Base
  attr_accessible :completed_on,
                  :description,
                  :name,
                  :settlement_date,
                  :settlement_status,
                  :started_on,
                  :status,
                  :type


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
