class ContactsController < ApplicationController
  def create
    if params[:admin]
      @contact = Contact.new new_contact_params

      if @contact.save
        render json: { data: @contact }, status: 201
      else
        render json: { errors: @contact.errors }, status: 400
      end

      return
    end

    render json: {errors: { api: 'Not Allowed' }}, status: 405
  end

  def update
    if params[:admin]
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

      return
    end

    render json: {errors: { api: 'Not Allowed' }}, status: 405
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
    if params[:admin]
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
      return
    end

    render json: {errors: { api: 'Not Allowed' }}, status: 405
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
end
