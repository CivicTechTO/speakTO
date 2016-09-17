Rails.application.routes.draw do
  root 'video_upload#new'

  get 'transcribe', to: 'video_processing#transcribe'
  get 'keywords', to: 'video_processing#keywords'
  get 'concepts', to: 'video_processing#concepts'

  post 'upload', to: :upload, controller: 'video_upload'
end
