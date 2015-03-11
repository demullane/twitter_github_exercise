Rails.application.routes.draw do

  root 'home#index'
    get '/github' => 'home#github' 

end
