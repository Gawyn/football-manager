FootballManager::Application.routes.draw do
 namespace :api, defaults: {format: 'json'} do
    namespace :v1, defaults: { format: 'json'} do 
      resources :teams, :only => [:index, :show]
    end
  end

  root to: "main#index"
end
