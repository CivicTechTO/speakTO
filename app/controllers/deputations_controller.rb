class DeputationsController < ApplicationController

  def new
  	render 'new'
  end

  def show
    @deputation = Deputation.includes(:concepts, :keywords).find(params[:id])
    @video_src = @deputation.video.url
  end

  def create
    upload = upload_params[:video]
    dep = Deputation.new
    dep.video = upload
    dep.save
    dep.process_video
    dep.save
    render json: { status: :success, results: { deputation: dep, url: deputation_url(dep) }}
  	# @file_name = params[:fname]
  	# @file_data = params[:data]
  	# @file_type = @file_data.content_type
  	# @file_object = @file_data.tempfile

   #  if (@file_type.isVideo)
  	#   applyVideoStrategy
  	# elsif (@file_type.isAudio)
   #    applyAudioStrategy
   #  end
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

  def upload_params
    params.permit!
  end

end

