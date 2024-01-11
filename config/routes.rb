# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  root to: redirect("/#{I18n.default_locale}/home#index")
  get '/:locale' => 'home#index', as: :home

  scope ':locale', locale: /#{I18n.available_locales.join('|')}/ do
    resources :books
  end
end
