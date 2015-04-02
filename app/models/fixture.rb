class Fixture < ActiveRecord::Base

	attr_accessor :home_team, :away_team, :date

	validates :date, presence: true
	validates :home_team, presence: true
	validates :away_team, presence: true
	belongs_to :tournament

end
