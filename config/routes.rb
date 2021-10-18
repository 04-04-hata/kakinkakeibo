Rails.application.routes.draw do

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root to: "homes#top"

  resources :kakeibos, only:[:new,:create,:show,:edit,:update,:index]
  resources :gacha_kakeibos
  get 'gacha_kakeibos/:kakeibo_id/gacha_kakeibo_data', :to => 'gacha_kakeibos#gacha_kakeibo_data', as: 'gacha_kakeibo_data'
  resources :other_kakeibos
  get 'other_kakeibos/:kakeibo_id/other_kakeibo_data', :to => 'other_kakeibos#other_kakeibo_data', as: 'other_kakeibo_data'


end
