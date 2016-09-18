class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video

  storage :file
  process encode_video: [:mp4, callbacks: { after_transcode: :set_success } ]
end