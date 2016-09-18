class VideoToAudio

  def self.call(file_path)
    binding.pry
    video = FFMPEG::Movie.new(file_path)
    audio = video.transcode( "audio_extract.mp3", :ab => 128 )
  end

end