class User < ApplicationRecord
  belongs_to :city
  has_many :gossip
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"

  def initialize(attributes=nil)
    attr_with_defaults = {:first_name => "Non renseigné", :last_name => "Non renseigné", :age => 0, :city => City.create(name:"Non renseigné"), :description => "Non renseigné"}.merge(attributes)
    super(attr_with_defaults)
  end

  def profile_url(first_name)
    url = "/welcome/#{first_name}"
    puts url
    return url
  end

  def self.find(id)
    user = User.find_by(id:id)
    return user 
  end

  # def self.find_user_in_db(url_first_name)
  #   unless User.find_by(first_name:url_first_name).nil?
  #     user = User.find_by(first_name:url_first_name)
  #     return user
  #   else
  #     user = User.create(first_name: url_first_name)
  #     return user
  #   end
  # end

  # def update_user_infos(first_name,last_name,email,age,city,description)
  #   self.first_name = first_name
  #   self.last_name = last_name
  #   self.email = email
  #   self.age = age
  #   self.city = city
  #   self.description = description
  # end

end
