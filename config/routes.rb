Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'farms#index'
  get '/farms' => 'farms#index', as: 'farms'
  get '/farms/new' => 'farms#new', as: 'new_farm'
  post '/farms' => 'farms#create'
  get '/farms/:id' => 'farms#show' , as: 'farm'
  get '/farms/:id/edit' => 'farms#edit', as: 'edit_farm'
  patch '/farms/:id' => 'farms#update'
  delete '/farms/:id' => 'farms#destroy'

  get '/kopis' => 'kopis#index', as: 'kopis'
  get '/kopis/new' => 'kopis#new', as: 'new_kopi'
  post '/kopis' => 'kopis#create'
  get '/kopis/:id' => 'kopis#show' , as: 'kopi'
  get '/kopis/:id/edit' => 'kopis#edit', as: 'edit_kopi'
  patch '/kopis/:id' => 'kopis#update'
  delete '/kopis/:id' => 'kopis#destroy'

  # get '/parks/:park_id/rangers' => 'rangers#index', as: 'park_rangers'
  # get '/parks/:park_id/rangers/new' => 'rangers#create', as: 'new_park_ranger'
  # post '/parks/:park_id/rangers' => 'rangers#create'

end