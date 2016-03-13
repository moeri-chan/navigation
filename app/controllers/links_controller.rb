class LinksController < ApplicationController
  def index
    @links=Link.all
    @link=Link.new
    respond_to do |format|
      format.json { render json: @links }
      format.html { render :index }
    end
  end
  def create
    link = Link.create link_params
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render :json => link }
    end
  end
  def update
    link = Link.find id_param
    link.update_attributes link_params
    respond_to do |format|
      format.html { redirect_to posts_path, :notice => 'Your post has successfully been updated' }
      format.json { render nothing: true }
    end
  end
  def destroy
    Link.find(id_param).destroy
    respond_to do |format|
      format.html { redirect_to :back, :notice => 'Link has been deleted.' }
      format.json { render nothing: true }
    end
  end
  def id_param
    params.require(:id)
  end
  def link_params
    params.require(:link).permit(:title, :url)
  end
end
