class ProfilesController < ApplicationController
  before_action :authenticate_user, only: [:index, :show]
  
  def index
  end

  def show
  end




  private


  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end


end
