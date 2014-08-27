Rails.application.routes.draw do
  # Routes for the Password_page resource:
  # CREATE
  # get '/new_password_page' => 'password_pages#new'
  # get '/create_password_page' => 'password_pages#create'

  # READ
  get '/password_pages' => 'password_pages#index'
  # get '/password_pages/:id' => 'password_pages#show'

  # UPDATE
  #get '/password_pages/:id/edit' => 'password_pages#edit'
  #get '/password_pages/:id/update' => 'password_pages#update'

  # DELETE
  # get '/password_pages/:id/destroy' => 'password_pages#destroy'
  #------------------------------

  # Miscellaneous routes:
  get '/home' => 'application#home'
  get '/' => 'application#home'
  get '/random_password' => 'password_pages#randompassword'
  
  # Routes for Passphrase: 
  get '/random_passphrase' => 'passphrases#random_passphrase'
  get '/passphrases' => 'passphrases#index'
end
