class Song < ApplicationRecord

	validates :name, presence: true

	has_many :sings

end
