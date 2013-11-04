DemoApiConsumer::Application.routes.draw do

  root :to => "admin/teams#index"

  namespace :admin do
  
    resources :teams, only: [:index, :show, :edit, :update]
    resources :composites, only: [:index, :show, :edit, :update]

  end

end
