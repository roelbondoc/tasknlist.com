class TasksController < ApplicationController
  def create
    @list = List.find_by_permalink(params[:list_id])
    @task = @list.tasks.new(params[:task])
    @task.save
    redirect_to list_path(@task.list.permalink)
  end

  def update
    @list = List.find_by_permalink(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.update_attributes(params[:task])
    respond_to do |format|
      format.json { render :json => @task.to_json }
    end
  end
end
