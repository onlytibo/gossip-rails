class StaticController < ApplicationController
  
  def team
  end

  def contact
  end

  def welcome_post
    user = User.find_or_create_by(first_name: params['first_name_form'], last_name: params['last_name'], email: params['email'], age: params['age'], city: City.create(name: params['name']), description: params['description'])
    url = @user.profile_url(params['first_name_form'])
    redirect_to url
  end

  def welcome
    @user_welcome = params['first_name']
  end
end
