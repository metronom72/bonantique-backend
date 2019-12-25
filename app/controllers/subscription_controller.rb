class SubscriptionController < ApplicationController
  def subscribe
    @subscription = Subscription.new(email: params[:email])
    if @subscription.save
      render json: @subscription
    else
      render json: @subscription.errors
    end
  end
end
