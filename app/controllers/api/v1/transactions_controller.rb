class Api::V1::TransactionsController < ApplicationController
  before_action :find_transaction, only: [:update, :show, :destroy]

  def index
    @transactions = Transaction.all
    render json: @transactions
  end

  def show
    render json: @transaction
  end

  def create
    @transaction = Transaction.create(transaction_params)
    if @transaction.save
      render json: @transaction, status: :accepted
    else
      render json: { errors: @transaction.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @transaction.destroy
  end

  private

  def transaction_params
    params.permit()
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

end
end
