class TasksController < ApplicationController
  def new
    @list_id = params[:list]
    @task = Task.new
  end

  def create
    list = List.find(params[:task][:list_id])
    task = list.tasks.new(task_params)
    if task.save
      redirect_to lists_path
    else
      flash[:error] = "Please try again!"
      @task = Task.new
      render :new
    end
  end

  def edit
    @list_id = params[:list]
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      redirect_to lists_path
    else
      flash[:errors] = "Please try again!"
      render :edit
    end
  end

  def completion
    @task = Task.find(params[:id])
    task.complete!(task)
    respond_to do |format|
      format.html { redirect_to lists_path }
      format.js
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def task_params
    params.require(:task).permit(:title, :due_date, :list_id)
  end
end
