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
    @list.save
    redirect_to root_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :movies, :photo)
  end
end
