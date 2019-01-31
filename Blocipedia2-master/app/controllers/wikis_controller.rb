class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if user_signed_in?
      if current_user.standard?
        @wikis = Wiki.where(private: false)
      else
        @wikis = policy_scope(Wiki)
      end
    else
      @wikis = policy_scope(Wiki)
    end
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @wiki = Wiki.find(params[:id])
    @users = User.find_by(id: session[:user_id])
    @collaborators = @wiki.collaborators
  end

  def new
     @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:body, :title, :private)
  end

end
