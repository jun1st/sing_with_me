require 'open-uri'
require 'streamio-ffmpeg'
require 'net/http'
require 'securerandom'

class HomeController < ApplicationController

	skip_before_action :authenticate_user!, only: [:compare]

  def index
  end

  def compare
  	song_id = params[:uuid]
  	song_url = params[:song_url]

  	movie = FFMPEG::Movie.new(song_url)

  	temp_path = "#{Rails.root}/public/#{song_id}_#{SecureRandom.hex}.wav"
  	
  	data1 = 
	  	if movie.audio_sample_rate != 22050
	  		movie.transcode(temp_path, { audio_sample_rate: 22050 })	
	  		File.binread(temp_path)
	  	else
	  		open(song_url).read
	  	end

		# Get audio data. Data should be in raw audio format with 16-bit signed samples.
		# The library doesn't care about decoding formats like mp3 or ogg, you should
		# do it yourself.
		# data1 = open(song_url).read
		# data1 = File.binread('https://huliaoappcdn.vwvvwv.com/minapp/2019/03/05/201903051851315312748732wechatapp.wav')

		# Create context for rate=44100 and channel=1.
		context1 = Chromaprint::Context.new(24000, 1)
		fingerprint_1 = context1.get_fingerprint(data1)

		# puts fingerprint_1
		# compressed_1 = fingerprint_1.compressed
		
		# Create context for rate=22050 and channel=2 and get fingerprint
		context2     = Chromaprint::Context.new(22050, 1)
		fingerprint_2 = context2.get_fingerprint(data1)
		# compressed_2 = fingerprint_2.compressed  # => "AQAALOkUKdlChE92NNeFn8EjF9..."

		song = Song.includes(:sings).find_by(uuid: song_id)
		max_rate = 0.0
		song.sings.each do |sing|
			# sing_finger_1 = Chromaprint::Fingerprint.new(sing.result, sing.raw_result)
			# r = fingerprint_1.compare(sing_finger_1)
			# max_rate = r if r > max_rate

			sing_finger_1 = Chromaprint::Fingerprint.new(sing.result_2, sing.raw_result_2)

			r = fingerprint_1.compare(sing_finger_1)
			max_rate = r if r > max_rate

			# sing_finger_1 = Chromaprint::Fingerprint.new(sing.result_2, sing.raw_result_2)
			r = fingerprint_2.compare(sing_finger_1)
			max_rate = r if r > max_rate
		end

		# Compare 2 fingerprints, result is 0..1 range, where 1 is 100% similarity.
		# fingerprint1.compare(fingerprint2)  # => 0.93231

  	render json: { rate: max_rate, compressed: fingerprint2.compressed, raw: fingerprint2.raw }
  end

  def songs_compare
  	song_url_1 = params[:song_url_1]
  	song_url_2 = params[:song_url_2]

  	data_1 = open(song_url_1).read
  	data_2 = open(song_url_2).read

  	context = Chromaprint::Context.new(22050, 1)

  	fingerprint1 = context.get_fingerprint(data_1)
  	fingerprint2 = context.get_fingerprint(data_2)

  	rate = fingerprint1.compare(fingerprint2)

  	return json: { rate: rate }
  end
end
