Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :entries, only: [:index, :update, :create, :delete, :show]
      resources :users, only: [:create]
    end
  end

end
