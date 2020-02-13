class GossipsController < ApplicationController
  before_action :set_gossip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :index, :create, :update, :new, :edit, :destroy]
  before_action :is_author?, only: [:update, :edit, :destroy]

  def index
    @gossips = Gossip.all
  end

  def show
    @comment = Comment.new
    @comments = @gossip.comments
    set_id
    # @comments = Comment.where(gossip:@id)
    # print @comments
  end

  def new
    @gossip = Gossip.new
  end

  def edit
  end
  
  def update
    if @gossip.update(title:params['title'],content:params['content'],user:current_user)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def create
    @gossip = Gossip.new(title:params['title'],content:params['content'],user:current_user)

    if @gossip.save
      flash[:success] = "Potin bien créé !"
      @success = "Bravo"
      redirect_to root_path(:add_gossip => @success)
    else
      @fail = @gossip.errors.full_messages
      render new_gossip_path
    end
  end

  def destroy
    @gossip.destroy
    redirect_to root_path(@gossip)
  end

  private

  def set_gossip
    @gossip = Gossip.find(params[:id])
  end
  
  def set_id
    @id = params['id']
  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def is_author?
    unless current_user == @gossip.user
      redirect_to @gossip
    end
  end

end
