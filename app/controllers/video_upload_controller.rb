class VideoUploadController < ApplicationController

  def new
  	render 'new'
  end

  def upload
  	@file_name = params[:fname]
  	@file_data = params[:data]
  	@file_type = @file_data.content_type
  	@file_object = @file_data.tempfile

    if (@file_type.isVideo)
  	  applyVideoStrategy
  	elsif (@file_type.isAudio)
      applyAudioStrategy
    end
  end

  private

  def isVideo
    binding.pry
  end

  def isAudio
    binding.pry
  end

  def applyVideoStrategy
  	binding.pry
  end

  def applyAudioStrategy
  	binding.pry
  end

end
