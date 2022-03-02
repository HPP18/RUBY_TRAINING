class LoginController < ApplicationController
  def setlogin
    if EMAIL === params[:email] && PASSWORD === params[:password]
      session[:email] = EMAIL
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Invalid email or password"
      render :login
    end
  end

  def setlogout
    session[:email] = nil
    redirect_to login_path, notice: "Logged out"
  end
end
