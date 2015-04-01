class Scrapper < ActiveRecord::Base
	has_many :fixtures
	has_one :competition
end
