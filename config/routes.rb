Rails.application.routes.draw do
  # presentation
  root 'stats#speakers_count'
  get 'stats/speakers'
  get 'stats/speakers_count'
  get 'year/:year', to: 'stats#by_year', as: 'by_year'
  get 'speaker/:speaker', to: 'stats#by_speaker', as: 'by_speaker'
  get 'speaker/:speaker/:year', to: 'stats#by_speaker_year', as: 'by_speaker_year'

  # admin
  get 'admin/talks/scrape', to: 'talk_admin#scrape'
  resources :speakers, :talks
end
