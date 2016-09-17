Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'transcribe', to: 'video_processing#transcribe'
  get 'keywords', to: 'video_processing#keywords'
  get 'concepts', to: 'video_processing#concepts'
end
