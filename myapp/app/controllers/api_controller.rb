class ApiController < ApplicationController
  before_action :set_json_accept

  private

  def set_json_accept
    request.format = :json
  end
end
