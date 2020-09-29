class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save!
    # Flashに"タスクを〜"を保持させてからリダイレクトする。
    redirect_to tasks_path, notice: "タスク「#{task.name}」を登録しました。"
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_path, notice: "タスク「#{task.name}」を更新しました。"
  end

  private
  def task_params
    # {task: {...}}の形かどうかチェックして、nameとdescriptionのだけを引っ張る
    params.require(:task).permit(:name, :description)
  end
end

# TODO: created_atの降順に並べる
# TODO: 削除機能つける
