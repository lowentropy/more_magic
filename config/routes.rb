Magic::Application.routes.draw do
  resources :cards do
    get :search, :on => :collection
  end
end
