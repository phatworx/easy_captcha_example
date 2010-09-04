class PagesController < ApplicationController
  def index
    
  end
  
  def tableless_model
    if request.post?
      @tableless_model = TablelessModel.new(params[:tableless_model])
      @tableless_model.captcha_verification = session[:captcha]
      if @tableless_model.valid?
        redirect_to :root, :notice => "valid captcha"
      end
    else
      @tableless_model = TablelessModel.new
    end
  end
  
  def simple_form
    if request.post?
      if valid_captcha? params[:captcha]
        redirect_to :root, :notice => "valid captcha"
      else
        flash[:alert] = "invalid captcha"
      end
    end
  end
end
