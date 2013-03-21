Kulen::Application.routes.draw do
  devise_for :users

  namespace :admin do
    get 'pages' => 'pages#index'
    get 'pages/*url' => 'pages#edit', as: 'edit_page'
    delete 'pages/*url' => 'pages#destroy', as: 'destroy_page'
    put 'pages/*url' => 'pages#update', as: 'update_page'
    post 'pages' => 'pages#create', as: 'create_page'
    get 'new_page' => 'pages#new', as: 'new_page'
    post 'pages_content' => 'pages#content'
    root to: 'pages#index'
  end

  get '/*url' => 'pages#pages'

end
