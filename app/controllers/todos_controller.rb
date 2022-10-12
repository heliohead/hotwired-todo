class TodosController < ApplicationController
  def create
    @todo = Todo.new(todo_params)
    @users = User.pluck(:username, :id)

    respond_to do |format|
      format.turbo_stream

      if @todo.save
        format.html { redirect_to todo_url(@todo) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :user_id)
  end
end
