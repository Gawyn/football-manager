FootballManager::Application.routes.draw do
  resources :teams, :only => [:show]

  root to: "main#index"
end
