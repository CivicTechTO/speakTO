class Transcriber
  include HTTParty

  def initialize(audio_filepath)
    @audio_filepath = audio_filepath
    @base_url = 'https://api.wit.ai/message'
    @api_key = 'U7TTRVYRFZX7KEEQIDIZ3CFN5PUO4BLA'
  end

  def call
    response = HTTParty.post(
                             @base_url, 
                             headers: { 'Authorization': "Bearer #{@api}"},
                             query: { q: 'test'})
    binding.pry
  end
end