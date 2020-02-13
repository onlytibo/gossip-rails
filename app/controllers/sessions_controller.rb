class SessionsController < ApplicationController

  def new
    # correspond à la page login
  end

  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email:params['email'])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params['password'])
      log_in(user)
      redirect_to root_path
      # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    # correspond au logout
  session.delete(:user_id)
  redirect_to root_path
  end
end