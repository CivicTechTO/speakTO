Rails.application.routes.draw do
  get 'transcribe', to: 'video_processing#transcribe'
  get 'keywords', to: 'video_processing#keywords'
  get 'concepts', to: 'video_processing#concepts'
  root 'video_upload#new'

  post 'upload', to: :upload, controller: 'video_upload'
end
