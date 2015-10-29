class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @users = User.all 
 
  end

  def show
    @users =User.all 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]).update(user_params)
    if @user
      if current_user[:shop]
        redirect_to new_company_path
      else
        redirect_to users_path
      end
    else
      render :edit
    end
  end



  # def destroy
     # @user = User.find(params[:id])
     # 
# 
  # end

private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :nickname, :first_name, :shop , :ip_address, :latitude, :longitude)
  end


end
