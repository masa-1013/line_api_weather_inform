Rails.application.routes.draw do
  root to: 'scraping#index'
  get '/scraping', to: 'scraping#index'
  post '/scraping', to: 'scraping#post'
end
