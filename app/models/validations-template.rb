validates :name, length: { minimum: 2 }
  validates :bio, length: { maximum: 500 }
  validates :password, length: { in: 6..20 }
  validates :registration_number, length: { is: 6 }


validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

validates :email, uniqueness: true

validates :email, presence: true


# errors : 
def create_user
  user = User.new(params)
  if params[:first_name].empty?
    puts "Erreur, pas possible de créer un utilisateur sans prénom"
  elsif params[:email].unique?
    puts "Email déjà pris"
  elsif user.save?
    puts "Utilisateur bien créé !"
  end
end

# callbacks
class User < ActiveRecord
  after_create :send_welcome_email

  def send_welcome_email
    # le code qui envoit l'email
  end

end