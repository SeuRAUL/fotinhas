class PicsController < ApplicationController
  before_action :pic, only: [:show, :edit, :update, :destroy]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show 
  end

  def new
    @pic = Pic.new
  end
  
  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      redirect_to @pic, notice: "Your picture was uploaded!"
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: "Your picture was updated!"
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @pic.destroy
    redirect_to root_path
  end

  private

    def pic
      @pic = Pic.find(params[:id])
    end

    def pic_params
      params.require(:pic).permit(:title, :description)
    end
end
