class Transcriber
  WIT_SCRIPT_PATH = Rails.root.join("app", "services", "transcribe.py")
  OUTPUT_FILE = Rails.root.join("app", "services", "wit_output.txt")

  def initialize(audio_filepath)
    @audio_filepath = audio_filepath
  end

  def call
    run_python_script
    read_output_file
  end

  def run_python_script
    %x(python #{WIT_SCRIPT_PATH} #{@audio_filepath} > #{OUTPUT_FILE})
  end

  def read_output_file
    File.read(OUTPUT_FILE)
  end

end