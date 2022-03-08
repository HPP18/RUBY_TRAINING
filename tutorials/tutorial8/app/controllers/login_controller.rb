class LoginController < ApplicationController
  def setlogin
    if EMAIL === params[:email] && PASSWORD === params[:password]
      session[:email] = EMAIL
      redirect_to root_path, notice: SUCCESS
    else
      flash[:alert] = INVALID
      render :login
    end
  end

  def setlogout
    session[:email] = nil
    redirect_to login_path, notice: LOGOUT
  end
end
