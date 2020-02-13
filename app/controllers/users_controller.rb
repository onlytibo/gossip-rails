class UsersController < ApplicationController

  def show
    @user = User.find(params['id'])
  end

  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def create
    # if city exist?
    if City.find_by(name:params['city']) != nil
      city = City.find_by(name:params['city'])
    else
      city = City.create(name:params['city'])
    end
    
    # new user
    @user = User.new(email:params['email'], password:params['password'], city: city, age:params['age'], first_name:params['first_name'], last_name: params['last_name'])

    if params['password'] == params['password_confirmation']
      if @user.save
        @success_login = "Bravo ! User inscrit !"
        log_in(@user)
        redirect_to root_path(:add_user => @success_login)
      else
        @user.errors.full_messages
        render 'new'
      end
    else
      @pwd_not_match = "Les passwords ne matchent pas !"
      render 'new'
    end
    # save or error
    

  end

  def edit

  end

  def update 

  end

  def destroy

  end


  
end
