class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if current_user.admin?    
        flash[:notice] = 'welcome !!'
        redirect_to admin_users_path
      else
        redirect_to tasks_path(user.id)
      end      
    else
      flash.now[:danger] = 'Login failed'
      render 'new'
    end
  end
  def destroy
    session.delete(:usr_id)
    flash[:notice] = 'You logged out'
    redirect_to new_session_path
  end
end
