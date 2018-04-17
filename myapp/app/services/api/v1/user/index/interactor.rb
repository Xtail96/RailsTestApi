require 'dry/transaction'

class Api::V1::User::Index::Interactor
  include Dry::Transaction

  step :cast
  step :resolve

  def cast(params)
    Success Api::V1::User::Index::Structure.new(params.to_h).to_h
  end

  def resolve(hash)
    Success Api::V1::User::Index::QueryBuilder.new(::User.all).call(hash)
  end
end