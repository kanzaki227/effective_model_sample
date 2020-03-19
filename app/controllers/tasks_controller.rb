class TasksController < ApplicationController

  def index
    @task = Task.new
    # モデルに定義したscopeはメソッドのように呼び出せる
    @tasks = Task.incoming.order(start_at: :asc)
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to tasks_path
  end

  # 定義しておいたメソッドを呼び出す
  def update
    @task = Task.find(params[:id])
    @task.update_finished_true
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :start_at, :finish_at, :kind, :finished)
  end
end
