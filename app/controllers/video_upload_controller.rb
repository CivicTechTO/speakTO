class VideoUploadController < ApplicationController

  def new
  	render 'new'
  end

  def upload
  	@file_name = params[:fname]
  	@file_data = params[:data]
  	@file_type = @file_data.content_type
  	@file_object = @file_data.tempfile
  end

end
