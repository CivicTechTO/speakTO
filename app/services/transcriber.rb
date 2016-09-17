class Transcriber
  include HTTParty

  def initialize(audio_filepath)
    @audio_filepath = audio_filepath
    @base_url = 'https://api.wit.ai/message'
    @api_key = 'KGYGTEHJJZERAUVBPDQULMGBERGI5E4E'
  end

  def call
    response = HTTParty.post(
                             @base_url, 
                             headers: { Authorization: "Bearer #{@api}"},
                             query: { })
  end
end