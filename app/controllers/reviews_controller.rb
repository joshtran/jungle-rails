class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    review = @product.reviews.new(review_params)
    review.user_id = current_user.id if current_user

    if review.save!
      redirect_to :back, notice: 'Your review has been saved.'
    else
      redirect_to :back
    end

  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end

end

# product_path(@product)

# Write out the logic for the create using the following CRUD approach:

# find the parent model
# Use the has_many association to initialize the child instance
# Attempt to save
# If successful: redirect to appropriate page
# Else: render the page where the form resides
# The one additional thing you will want to make sure you set on the instance of a review is the user:

# after @review has been initialized, but before calling .save on it:
# @review.user = current_user
