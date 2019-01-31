class CollaboratorsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:collaborator][:user])
    if @user == nil
      flash[:alert] = "That user could not be found."
      redirect_to edit_wiki_path(@wiki)
    else
      collaborator = @wiki.collaborators.build(user_id: @user.id)
      if collaborator.save
        flash[:notice] = "#{@user.email} has been added to the wiki. You can continue to add as many collaborators as you would like."
        redirect_to edit_wiki_path(@wiki)
      else
        flash[:alert] = "That user could not be added. Please try again."
        redirect_to edit_wiki_path(@wiki)
      end
    end
  end

   def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
     if @collaborator.destroy
      flash[:notice] = "Collaborator deleted."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error."
      redirect_to @wiki
    end
  end
end
