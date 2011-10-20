Todoapp::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => "users" }

  resources :users do
    resources :lists, :controller => "users/lists" do
      resources :items, :controller => "users/lists/items"
    end
    resources :user_lists, :controller => "users/user_lists"
  end

  resources :lists do
    resources :items
  end

  resources :user_lists

  root :to => "home#index"
end
