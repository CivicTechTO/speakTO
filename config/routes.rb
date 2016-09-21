Rails.application.routes.draw do
  root 'deputations#new'

  resources :deputations, only: [:index, :new, :create, :show, :update]

  get 'transcribe', to: 'audio_processing#transcribe'
  get 'keywords', to: 'audio_processing#keywords'
  get 'concepts', to: 'audio_processing#concepts'

  post 'upload', to: :upload, controller: 'video_upload'
end
