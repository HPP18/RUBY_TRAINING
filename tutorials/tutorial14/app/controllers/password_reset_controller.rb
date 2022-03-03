class PasswordResetController < ApplicationController
  def index
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_now
    end
    redirect_to root_path, notice: "We have already sent a link to reset your password"
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path, notice: "Your token has expired. Please try again"
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to root_path, notice: "Password reset successfully"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password)
  end
end
