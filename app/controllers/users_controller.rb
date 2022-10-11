class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.turbo_stream {
          flash[:notice] = success_message
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(User.new)}_form", partial: "form", locals: {user: User.new})
        }
        format.html { redirect_to todo_url(@user), notice: success_message }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("#{helpers.dom_id(@user)}_form", partial: "form", locals: {user: @user})
        }
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
