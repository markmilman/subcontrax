# == Schema Information
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Micropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :user
  attr_accessor :destroyed
  after_destroy :mark_as_destroyed


  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 144}

  default_scope order: 'microposts.created_at DESC'

  self.per_page = 5

  private
  def mark_as_destroyed
    self.destroyed = true
  end

end
