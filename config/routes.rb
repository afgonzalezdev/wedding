# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'welcome/index'
  get 'welcome/serve_pdf', to: 'welcome#serve_pdf', as: 'serve_welcome_pdf'

  resources :guests do
    resources :plus_ones
    member do
      get :confirm
      patch :complete
    end
  end

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end 
