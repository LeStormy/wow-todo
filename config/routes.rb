Rails.application.routes.draw do
  resources :sub_acts
  resources :main_acts
  resources :users
  resources :completions do
    post :undo, on: :member
    collection do
      post :create_with_count
    end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
