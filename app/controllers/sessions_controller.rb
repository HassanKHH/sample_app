class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email:params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to user
    else 
      #unsuccesful login
      flash[:danger] = "The email/password is wrong!"
      render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to login_url
  end
  
end
