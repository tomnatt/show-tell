Rails.application.routes.draw do
  root 'stats#speakers'

  get 'stats/speakers'
  resources :speakers, :talks
end
