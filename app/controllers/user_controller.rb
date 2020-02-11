class UserController < ApplicationController

  def welcome_post
    user = User.find_or_create_by(first_name: params['first_name_form'], last_name: params['last_name'], email: params['email'], age: params['age'], city: City.create(name: params['name']), description: params['description'])
    url = @user.profile_url(params['first_name_form'])
    redirect_to url
  end

  def welcome
    @user_welcome = params['first_name']
    # url_first_name = params['first_name']
    # @user = User.find_user_in_db(url_first_name)
  end

  def show_user
    @user = User.find(params['id'])
  end

  def authors_list
    @all_users = User.all
  end
end
