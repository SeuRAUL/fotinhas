class PicsController < ApplicationController
  before_action :pic, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show 
  end

  def new
    @pic = current_user.pics.build 
  end
  
  def create
    @pic = current_user.pics.build(pic_params)
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

  def upvote 
    @pic.upvote_by current_user
    redirect_to @pic
  end

  private

    def pic
      @pic = Pic.find(params[:id])
    end

    def pic_params
      params.require(:pic).permit(:title, :description, :picture)
    end
end
