class TodosController < ApplicationController
  def create
    @todo = Todo.new(todo_params)
    @users = User.pluck(:username, :id)

    respond_to do |format|
      if @todo.save
        @todo = Todo.new
        format.turbo_stream
        format.html { redirect_to todo_url(@todo) }
      else
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :user_id)
  end
end
