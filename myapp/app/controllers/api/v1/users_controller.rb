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
    nickname = params[:nickname]
    email = params[:email]
    password = params[:password]

    @user = User.new(:mickname => nickname, :email => email, :password => password)
    @user.save

    @user = User.find_by_email(email)

    token_value = SecureRandom.urlsafe_base64(nil, false)
    #@user.token.new(:access_value => token_value)
    @user.token = Token.new(:access_value => token_value)
    #@token = Token.new(:access_value => token_value)
  end

  # для обновления юзера
  def update
  end

  # для авторизации юзера
  def auth
  end

end
