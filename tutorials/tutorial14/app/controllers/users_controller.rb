class UsersController < ApplicationController
  def index
  end
  def create
    @email = params[:email]
    @password = params[:password]
  end
end
