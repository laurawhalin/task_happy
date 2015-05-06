class ListsController < ApplicationController
  def index
    @lists = List.where(active: true)
  end

  def new
    @list = List.new
  end

  def create
    list = List.new(list_params)
    if list.save
      redirect_to lists_path
    else
      flash[:error] = "Please try again!"
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      redirect_to lists_path
    else
      flash[:errors] = "Please try again!"
      render :edit
    end
  end

  def archive
    list = List.find(params[:id])
    list.archive!(list)
    redirect_to lists_path
  end

  def archived
    @lists = List.where(active: false)
    render action: :index
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
