Cms::Application.routes.draw do
  resources :articles
  root 'articles#index'
end
