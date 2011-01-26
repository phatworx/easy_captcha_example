EasyCaptchaExample::Application.routes.draw do
  captcha_route

  root :to => "pages#index"
  match "simple_form", :to => "pages#simple_form"
  match "tableless_model", :to => "pages#tableless_model"
  devise_for :users
end
