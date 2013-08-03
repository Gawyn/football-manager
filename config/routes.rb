FootballManager::Application.routes.draw do
  resources :teams, :only => [:show]

  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure" => "sessions#failure"

  root to: "main#index"
end
