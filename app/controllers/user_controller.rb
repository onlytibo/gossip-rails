class UserController < ApplicationController

  def welcome_post
    @first_name = params['first_name']
    first_name_url = "/welcome/#{@first_name}"
    redirect_to first_name_url
  end

  def welcome
    
  end

end
