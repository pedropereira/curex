# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :projects, only: [:create]

      get "/rate", to: "rates#show"
    end
  end
end
