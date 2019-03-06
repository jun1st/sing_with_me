require 'open-uri'

class Sing < ApplicationRecord

	validates :url, presence: true

	belongs_to :song

	before_save :calculate_fingerprint


	private
		def calculate_fingerprint
			if url_changed? && url.present?
				context1 = Chromaprint::Context.new(44100, 1)

				
				data1 = open(url).read
				fingerprint1 = context1.get_fingerprint(data1)

				# Create context for rate=22050 and channel=2 and get fingerprint
				context2     = Chromaprint::Context.new(22050, 1)
				
				fingerprint2 = context2.get_fingerprint(data1)

				self.result = fingerprint1.compressed
				self.result_2 = fingerprint2.compressed
			end
		end
end
