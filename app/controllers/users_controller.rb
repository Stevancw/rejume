

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
   @user = User.create(post_params)
      if @user.save
        redirect_to root_path, notice: "Thank you for signing up!"
      else
        flash.now.alert = "Please review the form"
        render 'new'
    end
  end

  private

    def post_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
