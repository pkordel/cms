Cms::Application.routes.draw do
  resources :articles
  # resources :article_generals, controller: :articles
  # resources :article_biographies, controller: :articles
  # resources :article_countries, controller: :articles
  # resources :article_cities, controller: :articles

  root 'articles#index'
end
