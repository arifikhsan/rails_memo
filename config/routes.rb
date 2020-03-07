Rails.application.routes.draw do
  resources :memos
  root 'memos#index'
end
