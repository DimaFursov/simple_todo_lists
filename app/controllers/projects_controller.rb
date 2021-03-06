class ProjectsController < ApplicationController
  before_action :set_project, only:    [ :update, :destroy]
  before_action :logged_in_user, only: [ :create, :update, :destroy, :show]
  before_action :correct_user,   only: [ :update, :destroy]
  
  def show 
    @project = Project.find(params[:id])
    @task = Task.find(params[:project_id])
    @tasks = @project.tasks        
  end

  def create        
    @project = current_user.projects.new(project_params)
    if @project.save      
      @projects = current_user.projects
      @project_count = current_user.projects.count
      render partial: @project      
    else      
      render json: @project.errors.messages, status: :unprocessable_entity
    end
  end

  def update 
    if @project.update(project_params)
      render json: @project 
    else
      render json: @project.errors.messages, status: :unprocessable_entity
    end  
  end  
        
  def destroy    
    @project.destroy    
    render plain: "delete"
  end

  private

  def project_params   
    params.require(:project).permit(:name)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def correct_user
    @project = current_user.projects.find_by(id: params[:id])
    redirect_to root_url if @project.nil?
  end
end