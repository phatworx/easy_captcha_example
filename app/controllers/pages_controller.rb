class PagesController < ApplicationController
  def index
    
  end
  
  def simple_form
    if request.post?
      if valid_captcha? params[:captcha]
        flash[:notice] = "valid captcha"
      else
        flash[:alert] = "invalid captcha"
      end
    end
  end
end
