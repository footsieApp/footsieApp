class ScrapperHistory < ActiveRecord::Base
	has_many :fixtures
	has_one :competition
end
