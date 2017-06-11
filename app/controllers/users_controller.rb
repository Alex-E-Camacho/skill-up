class UsersController < ApplicationController
  include SessionsHelper

  def show
    @user = User.find_by(id: params[:id])
    @skill = Skill.new
    @subcategories = Subcategory.all
    if @user != current_user
      redirect_to '/login'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Concert!"
      redirect_to "/",:notice => "signed up"
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        redirect_to @user
      else
        @errors = @user.errors.full_messages
        render 'edit'
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :birthdate, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end
