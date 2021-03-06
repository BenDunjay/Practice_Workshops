# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: :create
  resources :users do
    member do
      get :confirm_email
    end
  end

  resource :session, only: %i[new create destroy]
end
