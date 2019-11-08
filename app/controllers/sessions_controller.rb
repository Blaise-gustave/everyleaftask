class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
    
        flash[:notice] = 'welcome !!'
      redirect_to tasks_path(user.id)
    else
      flash.now[:danger] = 'Login failed'
      render 'new'
    end
  end
  def destroy
    session.delete(:usr_id)
    redirect_to new_session_path
  end
end
