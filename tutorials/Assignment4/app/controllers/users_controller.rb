class UsersController < ApplicationController
  before_action :sanitize_user_params

  def index
    @users = UserService.getAllUsers
    @users = User.search("name", params[:name]) if params[:name].present?
    @users = User.search("email", params[:email]) if params[:email].present?
    @users = User.search("user_type", params[:user_type]) if params[:user_type].present?
    @users = User.search("address", params[:address]) if params[:address].present?
    @users = User.search("dob", params[:dob]) if params[:dob].present?
    @users = User.search("phone", params[:phone]) if params[:phone].present?
  end

  def show
    @user = UserService.getUserById(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @is_user_create = UserService.createUser(@user)
    if @is_user_create
      flash[:success] = "Created successfully"
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = UserService.getUserById(params[:id])
  end

  def update
    @user = UserService.getUserById(params[:id])
    @is_user_update = UserService.updateUser(@user, user_params)
    if @is_user_update
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = UserService.getUserById(params[:id])
    @is_user_destroy = UserRepository.destroy(@user)

    if @is_user_destroy
      redirect_to root_path, status: :see_other
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type, :dob, :address, :phone)
  end

  def sanitize_user_params
    params[:type] = params[:type].to_i
  end
end
