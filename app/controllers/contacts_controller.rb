class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(active: true)
    render json: @contacts
  end
end
