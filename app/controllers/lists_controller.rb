class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to root_path(@list)
    else
      render :new, status: see_other
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.delete
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
