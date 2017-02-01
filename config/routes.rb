# frozen_string_literal: true
Rails.application.routes.draw do
  # # Overide default devise controllers
  devise_for :users, controllers: {
    # registrations: 'users/registrations',
    # sessions: 'users/sessions',
    # confirmations: 'users/confirmations',
    # unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], as: :finish_signup

  resources :users
  resources :messages
  root 'messages#index'

  mount ActionCable.server, at: '/cable'
end
