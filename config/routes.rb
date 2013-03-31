Cms::Application.routes.draw do
  resources :articles
  resources :article_types
  root 'articles#index'
end
