Kulen::Application.routes.draw do
  devise_for :users

  namespace :admin do 
    get 'pages' => 'pages#index'
    get 'pages/*url' => 'pages#edit', as: 'edit_page'
    put 'pages/*url' => 'pages#update', as: 'update_page'
    post 'pages_content' => 'pages#content'
    root to: 'pages#index'
  end

  get '/*url' => 'pages#pages'

end
