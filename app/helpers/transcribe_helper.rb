module TranscribeHelper
  %x(python transcribe.py #{@audio_file} > #{@text_file})
end
