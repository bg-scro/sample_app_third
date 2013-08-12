class UsersController < ApplicationController
	attr_accessor :name, :email
	
  def show
  	@user = User.find(params[:id])
  end
 
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Welcome to the Sample App!"
  		redirect_to @user
  	else
  		flash[:error] = "You suck!  What a silly dipshit, can't fill out a form!"
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, 
  						:email, :password, :password_confirmation)
  	end
end
