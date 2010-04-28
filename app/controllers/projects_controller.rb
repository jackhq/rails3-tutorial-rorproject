class ProjectsController < ApplicationController
  respond_to :html

  def index
    @projects = Project.order("created_at desc")
    respond_with @projects
  end
  
  def new
    @project = Project.new
    respond_with @project
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to projects_path
    else
      render "new"
    end
  end
  
  def show
    @project = Project.find_by_id(params[:id])
    respond_with @project
  end
  
  def edit
    @project = Project.find_by_id(params[:id])
    respond_with @project
  end
  
  def update
    @project = Project.find_by_id(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to project_path(@project)
    else
      render "edit"
    end
    
  end
  
  def destroy
    @project = Project.find_by_id(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  
  
  
  
end
