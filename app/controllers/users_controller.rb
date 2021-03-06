class UsersController < ApplicationController
  skip_filter :authenticate
  protect_from_forgery :except => :create
  
  def new
    @user = flash[:user] || User.new
    render :layout => 'yosemite'
  end
  
  def create
    @user = User.create(params[:user])
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to :controller => "task_lists"
    else
      flash[:user] = @user
      flash[:notice] = "Error creating user"
      redirect_to '/signup'
    end
  end
end
