Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  get "posts" => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts" => "posts#create"
  delete "posts/:id" => "posts#destroy"
  get "posts/:id/edit" => "posts#edit"
  patch "posts/:id" => "posts#update"

end
