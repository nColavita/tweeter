class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  def create
  	@user = User.create(params.require(:user).permit(:username, :email, :password, :location, :bio))
  	redirect_to user_path(@user.id), notice: "New account created!"
  end
end
