class SubscriptionController < ApplicationController
  def subscribe
    @subscription = Subscription.new new_subscription_params
    if @subscription.save
      render json: { data: @subscription }, status: 201
    else
      render json: { errors: @subscription.errors }, status: 400
    end
  end

  private
  def new_subscription_params
    params.require(:subscription).permit(:email)
  end
end
