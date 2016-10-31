Rails.application.routes.draw do
  # presentation
  root 'stats#speakers_count'
  get 'stats/speakers'
  get 'stats/speakers_count'
  get 'stats/:year', to: 'stats#by_year', as: 'by_year'

  # admin
  get 'admin/talks/scrape', to: 'talk_admin#scrape'
  resources :speakers, :talks
end
