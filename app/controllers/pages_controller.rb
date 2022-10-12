class PagesController < ApplicationController
  def index
    @users = User.order(id: :desc).pluck(:username, :id)
    @active_todos = Todo.active
    @completed_todos = Todo.completed
  end
end
