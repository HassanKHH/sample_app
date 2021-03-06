class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit,:update,:index]
  before_action :correct_user?, only:[:edit,:update]
  before_action :admin_user?, only:[:destroy]
  
  
  def show
    @user = User.find(params[:id])
    @micropost = user.microposts.build
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user
    else 
      render 'edit'
    end
  end
  
  def index
    @users = User.paginate(page:params[:page])
  end
    
  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end
    
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        redirect_to login_url
      end
    end
    
    def correct_user?
      unless current_user == User.find(params[:id])
        redirect_to root_url
      end
    end
    
    def admin_user?
      unless current_user.admin?
        redirect_to root_url
      end
    end

end
