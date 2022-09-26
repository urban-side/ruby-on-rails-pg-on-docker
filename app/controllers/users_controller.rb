class UsersController < ApplicationController
  before_action :set_varbs, only: [:show]
  before_action :logged_in_user
  before_action :admin_check, only: [:index, :destroy]

  def index
    @users = User.all.page(params[:page])
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to this App!"
      redirect_to root_url
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "User was successfully updated"
        redirect_to @user
      else
        flash[:danger] = "Update process: Something went wrong"
        render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = 'User was successfully deleted.'
      redirect_to users_url
    else
      flash[:danger] = 'Delete process: Something went wrong'
      redirect_to users_url
    end
  end
  
  def chrole
    @user = User.find(params[:id])
    if @user.update_attribute(:admin, !@user.admin?)
      flash[:success] = "User Role was successfully updated"
      redirect_to user_url(@user)
    else
      flash[:danger] = "Role Change process: Something went wrong, admin user maybe last one."
      redirect_to user_url(@user)
    end
  end

  private
    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation
      )
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def set_varbs
      @status = ["未着手", "作業中", "完了"]
      @priority_mark = ["", "!", "!!", "!!!"]
    end

    def admin_check
      unless current_user.admin?
        flash[:danger] = 'You have NO PERMISSION.'
        redirect_to user_path(current_user)
      end
    end
end
