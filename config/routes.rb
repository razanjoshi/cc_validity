Rails.application.routes.draw do
  # For details on the DSL available within this file, see 
  root 'credit_cards#index'
  resources :credit_cards
  match '/validate_card', to: 'credit_cards#validate_card', via: :get
end
