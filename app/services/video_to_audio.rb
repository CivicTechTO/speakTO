class VideoToAudio
  AUDIO_OUTPUT_FILEPATH = Rails.root.join("tmp", "audio_output.wav")

  def self.call(file_path)
    video = FFMPEG::Movie.new(file_path)
    video.transcode( AUDIO_OUTPUT_FILEPATH.to_s, :ab => 128 )
  end

end