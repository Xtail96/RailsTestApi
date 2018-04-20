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

    if(::User.find_by_email(email).present?)
      render json: "{\"status\": \"User already exist. Please choose different email\"}"
    else
      @user = ::User.new(:mickname => nickname, :email => email, :password => password)
      @user.save
      @user = ::User.find_by_email(email)
      token_value = SecureRandom.urlsafe_base64(nil, false)
      @user.token = Token.new(:access_value => token_value)
    end
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

  def reset_password
    email = params[:email]
    user = ::User.find_by_email(email)
    if(user.present?)
      password = change_password(email)
      UserMailer.reset_password_email(user, password).deliver
      render json: "{\"status\": \"password successfuly reset. check your email\"}"
    else
      render json: "{\"status\": \"email address is incorrect\"}"
    end
  end

  def generate_password
    return SecureRandom.hex(10)
  end

  def change_password(email)
    user = ::User.find_by_email(email)
    if(user.present?)
      user.password = generate_password
      user.save
    end
    return user.password
  end

end
