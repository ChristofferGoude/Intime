class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  # Landing page for a logged in user, where they can create a new project
  def overview
    @projects = Project.where(user_id: current_user.id)
  end
  
  # Creating a new project
  def new
    @project = Project.new
  end
  
  # Saving a new project with the specified parameters
  def create
    @project = Project.new(project_params)

    @project.user_id = current_user.id
    
    # Saving a new project created by the user
    if @project.save
      flash[:success] = "Your project was succesfully created!"
      redirect_to landing_path
      
    else
      flash[:alert] = "A problem occured while saving your project!"
      redirect_to landing_path
    end

  end
  
  # Showing a specific project
  def show
    @task = Task.new
    @project = Project.find(params[:id])
    @tasks = Task.where(project_id: params[:id])
    
    set_current_project(@project)
  end
  
  private
    # Always check for a logged in user before handling any project information
    def require_login
      unless logged_in?
        flash[:alert] = "You must be logged in to view this page!"
        redirect_to login_path
      end
    end
    
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:projectname)
    end
  
end
