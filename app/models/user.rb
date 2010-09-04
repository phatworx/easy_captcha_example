class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_writer :captcha, :captcha_verification
  
  def captcha
    ""
  end
  
  validate :valid_captcha?
  
  def valid_captcha?
    Rails.logger.debug "@captcha #{@captcha}"
    Rails.logger.debug "@captcha_verification #{@captcha_verification}"
    errors.add(:captcha, :captcha_invalid) unless @captcha.to_s.upcase == @captcha_verification.to_s.upcase
  end
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :captcha
end
