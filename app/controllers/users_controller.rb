class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @user = User.new
        flash[:notice] = success_message
        format.turbo_stream
        format.html { redirect_to todo_url(@user) }
      else
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def success_message
    "User was successfully created."
  end
end
