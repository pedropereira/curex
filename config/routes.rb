# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects, only: [:create]

  get "/rate", to: "rates#show"
end
