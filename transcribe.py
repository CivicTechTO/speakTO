import speech_recognition as sr
import sys

AUDIO_FILE = str(sys.argv[1])

recognizer = sr.Recognizer()
with sr.AudioFile(AUDIO_FILE) as source:
    audio = recognizer.record(source)

WIT_API_KEY = "KGYGTEHJJZERAUVBPDQULMGBERGI5E4E"

return recognizer.recognize_wit(audio, key=WIT_API_KEY)
