class SubscriptionController < ApplicationController
  def subscribe
    @subscription = Subscription.new(email: params[:email])
    if @subscription.save
      render json: @subscription
    else
      render json: @subscription.errors, status: 400
    end
  end
end
