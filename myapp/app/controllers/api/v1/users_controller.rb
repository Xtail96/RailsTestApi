class Api::V1::UsersController < ApiController

  # для навигации по юзерам
  def index
    @users = ::User.all
  end

  # для регистрации юзера
  def create
    nickname = params[:nickname]
    email = params[:email]
    password = params[:password]

    @user = ::User.new(:mickname => nickname, :email => email, :password => password)
    @user.save

    @user = ::User.find_by_email(email)

    token_value = SecureRandom.urlsafe_base64(nil, false)
    @user.token = Token.new(:access_value => token_value)
  end

  # для обновления юзера
  def update
  end

  # для авторизации юзера
  def auth
    email = params[:email]
    password = params[:password]

    user = ::User.find_by_email(email)
    if(user.present? && user.password == password)
      @token = user.token
    else
      render json: "{\"status\": \"auth_failed\"}"
    end

  end

end
