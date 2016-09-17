Rails.application.routes.draw do
  root 'video_upload#new'

  post 'upload', to: :upload, controller: 'video_upload'
end
