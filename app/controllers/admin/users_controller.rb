class Admin::UsersController < ApplicationController
  # before_action :only_see_own_page, only: [:show,:destroy, :edit]
  # before_action :only_create_user_when_none_signed_in , only:[:new, :create]
  before_action :require_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @tasks=Task.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        
        if current_user.present?
        format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
         else
          # format.html { redirect_to admin_users_url, notice: 'User was successfully created.' }
          #  format.json { render :show, status: :created, location: @user }
          session[:user_id] = @user.id
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def require_admin
    unless current_user.try(:admin?)
      redirect_to root_path, notice: "are you admin?please login"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.id == current_user.id
      redirect_to admin_users_url, notice: "You can not delete signed in user"
      @admins = User.admins
    elsif @admins == 1
      redirect_to admin_users_url, notice: "At least one admin must remain!"
    else
      @user.destroy
      redirect_to admin_users_url, notice: 'User was successfully destroyed.'
    end
  end

  private

  def only_see_own_page
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to users_path, notice: "Sorry, but you are only allowed to view your own profile page."
    end
  end
 def only_create_user_when_none_signed_in
    if current_user
      redirect_to users_path,  notice: "you can't create user when signed in"
    end
  end
  
  
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:fullname, :email, :telephone, :password, :password_confirmation, :admin)
    end
end
