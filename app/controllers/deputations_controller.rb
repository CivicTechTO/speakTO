class DeputationsController < ApplicationController

  def index
    @deputations = Deputation.includes(:concepts, :keywords).where.not(transcription: nil).order(created_at: :desc)
  end

  def new
  	render 'new'
  end

  def show
    @deputation = Deputation.includes(:concepts, :keywords).find(params[:id])
    @concepts = @deputation.concepts.map(&:text).join(', ')
    @video_src = @deputation.video.url
  end

  def create
    begin
      upload = upload_params[:video]
      dep = Deputation.new
      dep.video = upload
      dep.save
      dep.process_video
      dep.save
      render json: { status: :success, result: { deputation: dep, url: deputation_url(dep) }}
    rescue
      render json: { status: :unprocessable_entity }, status: 500
    end
  end

  def update
    dep = Deputation.find(upload_params[:id])
    dep.update_attributes(upload_params)
    begin 
      dep.save!
      render json: { status: :success, result: { deputation: dep, url: deputation_url(dep) }}
    rescue
      render json: { status: :unprocessable_entity }, status: 500
    end
  end

  private

  def upload_params
    params.permit!
  end

end

