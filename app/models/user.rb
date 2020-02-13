require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  has_secure_password
  belongs_to :city, optional: true
  has_many :gossip
  has_many :likes
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  validates :password, presence: true, length: { minimum: 6 }

  # def initialize(attributes=nil)
  #   attr_with_defaults = {:first_name => "Non renseigné", :last_name => "Non renseigné", :age => 0, :city => City.create(name:"Non renseigné"), :description => "Non renseigné"}.merge(attributes)
  #   super(attr_with_defaults)
  # end

# CUSTOM METHODS =====================================

  def profile_url(first_name)
    url = "/welcome/#{first_name}"
    puts url
    return url
  end

  def self.find(id)
    user = User.find_by(id:id)
    return user 
  end


# BCRYPT METHODS =====================================
  # def password
  #   @password ||= Password.new(password_hash)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end
