class DragonsController < ApplicationController
  before_action :set_dragon, only: [:show, :edit, :update, :destroy]

  def index
    @dragons = Dragon.all
  end

  def show
  end

  def new
    @dragon = Dragon.new
  end

  def create
    @dragon = Dragon.new(dragon_params)
    @dragon.user = current_user
    if @dragon.save
      redirect_to dragons_path(@dragon)
    else render :new
    end
  end

  def dashboard
    @dragons = Dragon.all.where(user_id: current_user.id)
  end

  def destroy
    @dragon = Dragon.find(params[:id])
    @dragon.destroy
    redirect_to dragons_path, status: :see_other
  end

  def edit
  end

  def update
    @dragon.update(dragon_params)
    redirect_to dragon_path(@dragon)
  end

  private

  def dragon_params
    params.require(:dragon).permit(:name, :power, :level, :age, :price, :photo)
  end

  def set_dragon
    @dragon = Dragon.find(params[:id])
  end

end
