class TodosController < ApplicationController
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream { render :show }
      end
    end
  end

  def create
    @todo = Todo.new(todo_params)
    @users = User.order(id: :desc).pluck(:username, :id)

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
    params.require(:todo).permit(:title, :user_id, :status)
  end
end
