Rails.application.routes.draw do
  resources :sales, only: %i[create index new]

  root 'sales#index'
end
