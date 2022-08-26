class ReviewsController < ApplicationController
  def new
    @dragon = Dragon.find(params[:dragon_id])
    @review = Review.new(review_params)

  end


  private

  def dragon_params
    params.require(:dragon).permit(:name, :power, :level, :age, :price, :photo)
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :dragon_id)
  end
end
