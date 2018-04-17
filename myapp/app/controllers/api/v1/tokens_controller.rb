class Api::V1::TokensController < ApiController

  # для навигации по токенам
  def index
    @tokens = Token.all
  end
end