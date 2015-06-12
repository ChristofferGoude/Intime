class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    @task.project_id = current_project.id
    
    if @task.save
      flash[:success] = "Your task was succesfully created!"
      redirect_to project_path(current_project.id)
      
    else
      error = "The following information is required: "
      unless params[:taskname].present?
        error << "Taskname"       
      end
      unless params[:description].present?
        error << "Description"
      end    
      
      
      flash[:alert] = error
      error = ""
      redirect_to project_path(current_project.id)          
    end
  end
  
  def destroy
    
  end
  
  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:taskname, :description)
    end
  
end
