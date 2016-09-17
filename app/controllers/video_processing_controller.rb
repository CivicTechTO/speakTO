class VideoProcessingController < ApplicationController
  def transcribe
    audio_filepath = params['audio_filepath']
    scriber = Transcriber.new(audio_filepath)
    text = scriber.call
    render json: { status: :success, results: { transcription: text }}
  end

  def keywords
    text_filepath = params['text_filepath']
    processor = LanguageProcessor.new(text_filepath)
    keywords = processor.get_keywords
    render json: { status: :success, results: { keywords: keywords }}
  end

  def concepts
    text_filepath = params['text_filepath']
    processor = LanguageProcessor.new(text_filepath)
    concepts = processor.get_concepts
    render json: { status: :success, results: { concepts: concepts }}
  end
end
