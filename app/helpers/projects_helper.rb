module ProjectsHelper 
  def set_current_project(project)
    session[:project_id] = project.id
  end
  
  # Returns the current project (if any).
  def current_project
    @current_project ||= Project.find_by(id: session[:project_id])
  end
  
  def unset_current_project
    session.delete(:project_id)
    @current_project = nil
  end
end
