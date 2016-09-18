class Deputation < ApplicationRecord
  has_many :keywords
  has_many :concepts
  has_attached_file :video
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/

  def process_video
    video_filepath = self.video.path
    VideoToAudio.call(video_filepath)
    # audio_filepath = Rails.root.join("spec", "fixtures", "call_everybody.wav")
    scriber = Transcriber.new VideoToAudio::AUDIO_OUTPUT_FILEPATH
    text = scriber.call

    self.transcription = text

    lp = LanguageProcessor.new(text: text)
    concepts = lp.get_concepts
    keywords = lp.get_keywords

    add_keywords(keywords)
    add_concepts(concepts)
  end

  private

  def add_keywords(keywords)
    keywords.each do |kw|
      self.keywords.create(kw)
    end
  end

  def add_concepts(concepts)
    concepts.each do |c|
      self.concepts.create(c)
    end
  end
end