class DragonsController < ApplicationController
  before_action :set_dragon, only [:show, :destroy]

  def index
    @dragons = Dragon.all
  end

  def show
    @dragon = Dragon.find(params[:id])
  end

  def new
    @dragon = Dragon.new
  end

  def create
    @dragon = Dragon.new(dragon_params)
    if @dragon.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  def destroy
    @dragon.destroy
    redirect_to dragons_path
  end

  private

  def dragon_params
    params.require(:dragons).permit(:name, :power, :level, :age, :price)
  end

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end

end
