class NavbarsController < ApplicationController
  def show
    @links=Link.all
    respond_to do |format|
      format.json { render json: @links }
      format.html { render :show }
    end
  end
end
