Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :wine_strains
  resources :strains
  resources :wines
  resources :oenologists
  resources :magazines

  

  root 'wines#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
