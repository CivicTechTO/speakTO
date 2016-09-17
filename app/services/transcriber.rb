class Transcriber
  OUTPUT_FILE = './wit_output.txt'

  def self.call(audio_filepath)
    run_python_script(audio_filepath)
    read_output_file
  end

  def run_python_script(audio_filepath)
    %x(python transcribe.py #{audio_filepath} > #{OUTPUT_FILE})
  end

  def read_output_file
    text = File.read(OUTPUT_FILE)
    binding.pry
  end

end