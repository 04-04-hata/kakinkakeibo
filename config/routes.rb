Rails.application.routes.draw do
  
  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  root to: "homes#top"
  
  resources :kakeibos
  resources :gacha_kakeibos
  resources :other_kakeibos
  
end
