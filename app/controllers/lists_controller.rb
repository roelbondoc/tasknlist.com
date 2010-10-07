class ListsController < ApplicationController
  def index
    list = List.create
    redirect_to "/#{list.permalink}"
  end

  def show
    @list = List.find_by_permalink(params[:permalink] || params[:id])
  end

  def update
    @list = List.find_by_permalink(params[:permalink] || params[:id])
    @list.update_attributes(params[:list])
    respond_to do |format|
      format.json { render :json => @list.to_json }
    end
  end
end
