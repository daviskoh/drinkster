Drinkster::Application.routes.draw do
  root to: 'main#index'

  scope 'api' do 
    resources :users, only: [:create, :show]

    resource :session, only: [:create, :destroy]
  end

  match '*path', to: 'main#index', via: :get
end
