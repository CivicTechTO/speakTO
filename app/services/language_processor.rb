class LanguageProcessor
  include HTTParty

  def initialize(text_filepath)
    file_contents = File.read(text_filepath)
    @text = CGI::escape(file_contents)
    @output = 'json'
    @base_url = 'https://gateway-a.watsonplatform.net/calls'
    @api_key = 'e642044fa6724367c8373801f0bd63a82be41c6c'
  end

  def get_concepts
    url = '/text/TextGetRankedConcepts'
    parameters = "apikey=#{@api_key}&outputMode=#{@output}&text=#{@text}"
    json_response = make_api_call "#{@base_url}#{url}?#{parameters}"
    parse_concepts(json_response)
  end

  def get_keywords
    url = '/text/TextGetRankedKeywords'
    parameters = "apikey=#{@api_key}&outputMode=#{@output}&text=#{@text}"
    json_response = make_api_call "#{@base_url}#{url}?#{parameters}"
    parse_keywords(json_response)
  end

  private

  def make_api_call(url)
    response = HTTParty.get(url)
    response.body
  end

  def parse_concepts(json_response)
    results = JSON.parse(json_response)
    results['concepts'].collect do |concept|
      concept['text']
    end
  end

  def parse_keywords(json_response)
    results = JSON.parse(json_response)
    results['keywords'].collect do |keyword|
      keyword['text']
    end
  end
end
