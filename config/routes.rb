EasyCaptchaExample::Application.routes.draw do
  root :to => "pages#index"
  match "simple_form", :to => "pages#simple_form"
  match "tableless_model", :to => "pages#tableless_model"
  match "captcha" => EasyCaptcha::Controller
  devise_for :users
end
