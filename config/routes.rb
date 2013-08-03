FootballManager::Application.routes.draw do
  resources :teams, :only => [:show]

  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure" => "sessions#failure"
  get "/auth/destroy" => "sessions#destroy"

  root to: "main#index"
end
