class ContactSharesController < ApplicationController
  def create
    @contact_share = ContactShare.new(contact_share_params)

    if @contact_share.save
      render json: @contact_share
    else
      render(
        json: @contact_share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def delete
    @contact_share = ContactShare.find(params[:id])

    ContactShare.destroy(params[:id])
    render json: @contact_share
  end

  private
  def contact_share_params
    params.permit(:user_id, :contact_id)
  end
end
