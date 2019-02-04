class TransactionSerializer < ActiveModel::Serializer
  attributes :user_id, :stock_symbol, :num_shares, :price, :cost, :commission, :order_type, :date_time
end
