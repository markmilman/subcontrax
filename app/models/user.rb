# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  has_many :microposts, dependent: :destroy

  # relationships is the table tha holds the link between a user and its followers and the users it follows
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy, class_name: "Relationship"
  # followed users are the set of users a user is following
  has_many :followed_users, through: :relationships, source: :followed
  # the reverse relationship is a symbol creating a form of a virtual table that will allow the creation of
  # the below followers relationship
  has_many :reverse_relationships, foreign_key: "followed_id",
           class_name: "Relationship",
           dependent: :destroy
  # followers are made available thanks to the reverse relationship virtual table above
  has_many :followers, through: :reverse_relationships, source: :follower


# name validation
  validates :name, {presence: true, length: {maximum: 255}}

  # email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}


# password validation  
  validates :password, length: {minimum: 6}
  validates :password_confirmation, presence: true
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    #Micropost.where("user_id = ?", id)
    Micropost.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64

  end


end
