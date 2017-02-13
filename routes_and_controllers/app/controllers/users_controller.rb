class UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      begin
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
      rescue RestClient::Exception
        retry
      end
    end
  end

  def show
    render json: params
  end

  def update
    @user = User.where(id: params[:id])
    @user.update(params[:id], user_params)
    render json: @user
  end

  def delete
    @user = User.where(id: params[:id])
    User.destroy(params[:id])
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
