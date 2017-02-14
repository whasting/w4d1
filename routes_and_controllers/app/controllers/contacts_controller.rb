class ContactsController < ApplicationController
  def index
    @contacts = Contact.where(user_id: params[:user_id], id: params[:contact_id])
    render json: @contacts
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    @contact = Contact.find(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      render json: @contact
    else
      render(
        json: @contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def delete
    @contact = Contact.find(params[:id])
    Contact.destroy(params[:id])
    render json: @contact
  end

  private
  def contact_params
    params.require(:contat).permit(:name, :email, :user_id)
  end
end
