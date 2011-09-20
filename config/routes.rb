Magic::Application.routes.draw do
  resources :cards do
    collection do
      get :search, :set_examples
    end
  end
  resource :collection
  resources :decks
  resources :copies
  resources :card_sets
  root :to => 'home#index'
end
