class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    # Index page for application
  end
  
  def new
    @user = User.new
  end
  
  def create
    # Creating a new user
    @user = User.new(user_params)

    if @user.save    
      log_in(@user)
      flash[:success] = "Your account was successfully registered!" 
      redirect_to root_path
    else  
      flash[:alert] = "Please enter all required fields!"
      redirect_to register_path
    end
  end
  
  def login
    # Login of existing user
  end
  
  def about
    # Simple about page
  end
   
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
