Rails.application.routes.draw do

  # Miscellaneous routes:
  get '/' => 'password_pages#randompassword'
  get '/random_password' => 'password_pages#randompassword'
  
  # Routes for Passphrase: 
  get '/random_passphrase' => 'passphrases#random_passphrase'
end
