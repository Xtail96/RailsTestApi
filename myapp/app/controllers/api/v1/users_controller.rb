class Api::V1::UsersController < ApiController

  # для навигации по юзерам
  def index
    @users = User.all
    #Api::V1::User::Index::Interactor.new.call do |m|
    #  m.success do |response|
    #    @users = response
    #  end
    #  m.failure do |response|
    #    render json: response, status: :bad_request
    #  end
    #end
  end

  # для регистрации юзера
  def create
  end

  # для обновления юзера
  def update
  end

  # для авторизации юзера
  def auth
  end

end
