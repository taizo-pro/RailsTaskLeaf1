class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save!
    # Flashに"タスクを〜"を保持させてからリダイレクトする。
    redirect_to tasks_path, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
  end

  private
  def task_params
    # {task: {...}}の形かどうかチェックして、nameとdescriptionのだけを引っ張る
    params.require(:task).permit(:name, :description)
  end
end
