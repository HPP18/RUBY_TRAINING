class UsersController < ApplicationController
  def index
    @users = UserService.getAllUsers
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
    params.require(:user).permit(:name, :address, :phone)
  end
end
