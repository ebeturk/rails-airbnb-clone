class DragonsController < ApplicationController
  before_action :set_dragon, only: %i[ show destroy ]


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
    # @dragon.user = current_user
    @dragon.save
    redirect_to dragons_path(@dragon)
  end

  def destroy
    @dragon = Dragon.find(params[:id])
    @dragon.destroy
    redirect_to dragons_path, status: :see_other
  end

  private

  def dragon_params
    params.require(:dragons).permit(:name, :power, :level, :age, :price)
  end

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end

end
