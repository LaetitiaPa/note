class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all.order('created_at DESC')
  end
  
  def show
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  
  private
  
  def find_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :content)
  end
end
