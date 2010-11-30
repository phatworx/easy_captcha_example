class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter lambda { session.delete(:captcha) }
end
