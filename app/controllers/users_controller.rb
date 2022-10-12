class UsersController < ApplicationController
  before_action :find_todos, only: :index

  def index
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

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

  def find_todos
    user = User.find_by(id: params[:user_id])

    if user.present?
      @active_todos = user.todos.active
      @completed_todos = user.todos.completed
    else
      @active_todos = Todo.active
      @completed_todos = Todo.completed
    end
  end
end
