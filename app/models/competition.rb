class Competition < ActiveRecord::Base
	has_many :fixtures
	belongs_to :scrapper
end
