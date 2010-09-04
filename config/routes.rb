EasyCaptchaExample::Application.routes.draw do
  root :to => "pages#index"
  match "simple_form", :to => "pages#simple_form"
  match "captcha" => EasyCaptcha::Controller
  devise_for :users
end
