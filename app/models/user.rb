class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  def save_user(params)
    Rails.logger.debug {"##{__FILE__} ##{__LINE__} params : #{params}"}

    user = User.new(
        username: params[:username],
        password: params[:password]
    )
    user.save

    count = MyView.select("count(*) as count");
    Rails.logger.info {"#{__FILE__}:#{__LINE__} count #{count[0].count}"}
  end

  def user_login(params)
    Rails.logger.info{"##{__FILE__} ##{__LINE__} user_login method start"}
    user = User.find_by_username(params[:username])
    if user.present?
      if user.password_hash == BCrypt::Engine.hash_secret(params[:password], user.password_salt)
        Rails.logger.debug{"##{__FILE__} ##{__LINE__} Login Successfulllll"}
      else
        Rails.logger.debug{"##{__FILE__} ##{__LINE__} Invalid password"}
      end
    else
      Rails.logger.debug{"##{__FILE__} ##{__LINE__} Invalid username"}
    end
    Rails.logger.info{"##{__FILE__} ##{__LINE__} user_login method end"}
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      self.password = password
    end
  end
end
