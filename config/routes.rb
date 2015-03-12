Rails.application.routes.draw do

  root 'home#index'
    get '/github' => 'home#github'
    get '/data' => 'home#data'
    get '/reddit' => 'home#reddit'

end
