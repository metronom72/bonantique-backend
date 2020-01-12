class BondsController < ApplicationController
  before_action :admin?, only: [:create]

  def create
    @bond = Bond.new(new_bond_params)

    if @bond.save
      render json: { data: {
          bond: @bond,
          specification: @bond.specification
      }}, status: 201
    else
      render json: { errors: @bond.errors }, status: 400
    end
  end

  private
  def new_bond_params
    params.require(:new_bond).permit(
      :title,
      :description,
      :valid_till,
      :available,
      :amount,
      :product_type,
      :bond_currency,
      :bond_value,
      :bond_serial,
      :bond_number,
      :is_copy,
      :quality,
      prices: [],
      bond_country: [],
    )
  end
  def admin?
    unless params[:admin]
      render json: {errors: { api: 'Not Allowed' }}, status: 405
    end
  end
end
