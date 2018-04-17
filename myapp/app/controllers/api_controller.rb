class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_json_accept

  private

  def set_json_accept
    request.format = :json
  end
end
