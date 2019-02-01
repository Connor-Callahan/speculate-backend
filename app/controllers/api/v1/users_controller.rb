class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
   @user = User.create(user_params)
   if @user.save
     render json: @user, status: :accepted
   else
     render json: { errors: @user.errors.full_messages }, status: :unprocessible_entity
   end
 end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { erros: @user.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :username, :password, :age, :income, :job, :balance)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
