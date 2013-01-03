Kulen::Application.routes.draw do
  devise_for :users

  namespace :admin do 
    get 'pages' => 'pages#index'
    get 'pages/*slug' => 'pages#edit', as: 'edit_page'
    put 'pages/*slug' => 'pages#update', as: 'update_page'
  end

  get '/*slug' => 'pages#pages'

end
