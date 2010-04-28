class TasksController < ApplicationController

  def create
    project = Project.find_by_id(params[:project_id])
    task = project.tasks.create(params[:task])
    redirect_to project
  end
  
  def update
    project = Project.find_by_id(params[:project_id])
    task = project.tasks.find_by_id(params[:id])
    task.completed = true
    task.save
    redirect_to project
    
  end
  
end
