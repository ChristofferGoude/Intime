class SessionsController < ApplicationController
  def new
    #Called to show login form
  end
  
  # Called when a users tries to login
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      
      flash[:success] = "Login complete!"
      redirect_to landing_path
    else
      # Create an error message.
      flash[:alert] = "Invalid username/password combination!"
      render "new"
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end
end
