require 'rails_helper'

RSpec.describe AudioProcessingController, type: :controller do
  context "valid audio file" do
    let(:audio_filepath) do
      Rails.root.join("spec", "fixtures", "call_everybody.wav")
    end

    let(:text_filepath) do
      Rails.root.join("spec", "fixtures", "test_text.txt")
    end

    describe "#transcribe" do
      it "accepts text file and returns keywords" do
        get :transcribe, { audio_filepath: audio_filepath }

        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json")
        expect(JSON.parse(response.body)["results"]['transcription']).to_not be_nil
      end
    end

    describe "#keywords" do
      it "accepts text file and returns keywords" do
        get :keywords, params: { text_filepath: text_filepath }, format: :json

        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json")
        expect(JSON.parse(response.body)["results"]['keywords']).to_not be_nil
      end
    end

    describe "#concepts" do
      it "accepts text file and returns concepts" do
        get :concepts, params: { text_filepath: text_filepath }, format: :json

        expect(response.status).to eq(200)
        expect(response.content_type).to eq("application/json")
        expect(JSON.parse(response.body)["results"]['concepts']).to_not be_nil
      end
    end
  end
end
