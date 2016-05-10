Rails.application.routes.draw do
  # presentation
  root 'stats#speakers'
  get 'stats/speakers'

  # admin
  get 'admin/talks/scrape', to: 'talk_admin#scrape'
  resources :speakers, :talks
end
