class Fixture < ActiveRecord::Base

	validate :date, presence: true
	validate :home_team, presence: true
	validate :away_team, presence: true
	belongs_to :tournament

end
