Rails.application.routes.draw do
  resources :minesweeper_boards, only: [:new, :create, :show]
  
  get '/home', to: 'minesweeper_boards#home', as: 'home'
  get '/all_boards', to: 'minesweeper_boards#all_boards', as: 'all_boards'

  root 'minesweeper_boards#new'
end
