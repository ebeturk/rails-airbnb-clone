class ReviewsController < ApplicationController
  def new
    @dragon = Dragon.find(params[:dragon_id])
    @review = Review.new
  end


  private

  def dragon_params
    params.require(:dragon).permit(:name, :power, :level, :age, :price, :photo)
  end
end
