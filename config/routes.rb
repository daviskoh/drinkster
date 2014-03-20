Drinkster::Application.routes.draw do
  root to: 'main#index'

  scope 'api' do 
    resources :users, only: [:create, :show] do 
      resources :ingredients, only: [:create]
    end

    resource :session, only: [:create, :destroy]
  end

  match '*path', to: 'main#index', via: :get
end
