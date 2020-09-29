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
    @tasks = Task.new(task_params)
    @tasks.save!
    # Flashに"タスクを〜"を保持させてからリダイレクトする。
    redirect_to tasks_path, notice: "タスク「#{@tasks.name}」を登録しました。"
  end

  def edit
    @tasks = Task.find(params[:id])
  end

  def update
    @tasks = Task.find(params[:id])
    @tasks.update!(task_params)
    redirect_to tasks_path, notice: "タスク「#{@tasks.name}」を更新しました。"
  end

  def destroy
    @tasks = Task.find(params[:id])
    @tasks.destroy
    redirect_to tasks_path, notice: "タスク「#{@tasks.name}」を削除しました。"
  end

  private
  def task_params
    # {task: {...}}の形かどうかチェックして、nameとdescriptionのだけを引っ張る
    params.require(:task).permit(:name, :description)
  end
end

