class AuthenticateUser
  def initialize(code, password)

    @code = code
    @password = password

  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id) unless user.nil?
  end

  def id
    user.id if user
  end

  def role
    user.role if user
  end

  private

  attr_reader :code, :password

  # verify user credentials
  def user
    user = User.find_by(code: code)
    if user && user.authenticate(password)
      return user
    end
  end
end