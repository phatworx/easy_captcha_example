class ApplicationController < ActionController::Base
  protect_from_forgery
end
# 
# # Devise Hack
# Devise::RegistrationsController.class_eval do
#   def build_resource(hash=nil)
#     super(hash)
#     self.resource.captcha_verification = session[:captcha]
#   end
# end
