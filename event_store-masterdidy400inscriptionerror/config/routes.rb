# frozen_string_literaassets/l: true

Rails.application.routes.draw do
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  root 'front#index'
end
