Rails.application.routes.draw do
  resources :store_csvs
  root 'welcome#index'
end
