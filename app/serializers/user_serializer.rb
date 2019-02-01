class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :age, :income, :job, :balance
end
