class Api::V1::User::Index::QueryBuilder
  attr_accessor :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(hash)
    initial(initial_scope)
  end

  private
end