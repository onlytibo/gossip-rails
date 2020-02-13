class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :update, :new, :edit, :destroy]

  def index
    @comments = Comment.all
  end

  def show

  end
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.new(comment:params['comment']['comment'],user:current_user)

    if @comment.save
      flash[:success] = "Potin bien créé !"
      redirect_to @gossip
    else
      @comment.errors.full_messages
      redirect_to @gossip
    end
     
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])

    @comment = Comment.find(params[:id])

    @comment.destroy

    redirect_to @gossip

  end

  private

  def comment_params
    params.require(:comment).permit(:comment)

  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end
