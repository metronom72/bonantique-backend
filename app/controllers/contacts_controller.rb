class ContactsController < ApplicationController
  before_action :admin?, only: [:create, :update, :delete]

  def create
    @contact = Contact.new new_contact_params

    if @contact.save
      render json: { data: @contact }, status: 201
    else
      render json: { errors: @contact.errors }, status: 400
    end
  end

  def update
    @contact = Contact.unscoped.find_by id: params[:id]

    if @contact
      if @contact.update update_contact_params
        render json: { data: @contact }
      else
        render json: { errors: @contact.errors }, status: 400
      end
    else
      render json: { errors: { api: "Not found" }}, status: 404
    end
  end

  def index
    if params[:admin]
      @contacts = Contact.unscoped.all
    else
      @contacts = Contact.all
    end

    render json: { data: @contacts }
  end

  def delete
    @contact = Contact.unscoped.find_by id: params[:id]
    if @contact
      if @contact.delete
        render status: 204
      else
        render json: { errors: @contact.errors }, status: 400
      end
    else
      render json: { errors: { api: "Not found" }}, status: 404
    end
  end

  private
  def new_contact_params
    params.require(:new_contact).permit(
        :value,
        :label,
        :link,
        :scope,
        :active
    )
  end
  def update_contact_params
    params.require(:contact).permit(
        :value,
        :label,
        :link,
        :scope,
        :active
    )
  end
  def admin?
    unless params[:admin]
      render json: {errors: { api: 'Not Allowed' }}, status: 405
    end
  end
end
