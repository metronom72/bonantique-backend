class BondsController < ApplicationController
  before_action :admin?, only: [:create]

  def create
    @bond = new Bond(new_bond_params)

    if @bond.save
      render json: { data: @bond }, status: 201
    else
      render json: { errors: @bond.errors }, status: 400
    end
  end

  private
  def new_bond_params
    params.require(:new_bond).permit(
      :title,
      :description,
      :prices,
      :valid_till,
      :available,
      :amount,
      :product_type,
      :bond_currency,
      :bond_value,
      :bond_serial,
      :bond_number,
      :bond_country,
      :is_copy,
    )
  end
  def admin?
    unless params[:admin]
      render json: {errors: { api: 'Not Allowed' }}, status: 405
    end
  end
end
