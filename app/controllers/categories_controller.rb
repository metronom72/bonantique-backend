class CategoriesController < ApplicationController
  before_action :admin?, only: [:create, :update, :delete]
  def create
    @category = Category.new new_category_params

    if @category.save
      render json: { data: @category }, status: 201

      return
    else
      render json: { errors: @category.errors }, status: 400

      return
    end
  end
  def index
    if params[:admin]
      @categories = Category.unscoped.all
    else
      @categories = Category.all
    end

    render json: { data: @categories }
  end
  def update
    @category = Category.unscoped.find_by slug: params[:id]

    if @category
      if @category.update update_category_params
        render json: { data: @category }

        return
      else
        render json: { errors: @category.errors }, status: 400

        return
      end
    else
      render json: { errors: { api: "Not found" }}, status: 404

      return
    end
  end
  def delete

  end

  private
  def new_category_params
    params.require(:new_category).permit(
        :title,
        :slug,
        :parent_category_id,
        :active
    )
  end
  def update_category_params
    params.require(:category).permit(
        :title,
        :slug,
        :parent_category_id,
        :active
    )
  end
  def admin?
    unless params[:admin]
      render json: {errors: { api: 'Not Allowed' }}, status: 405
    end
  end
end
