# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :contacts

      get '/via_cep/:cep', to: 'via_cep#index'
    end
  end
end
