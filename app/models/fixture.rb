class Fixture < ActiveRecord::Base
	include Filterable

	belongs_to :competition
	belongs_to :scrapper
	belongs_to :hometeam, class_name: "Team",
						foreign_key: "hometeam_id"
	belongs_to :awayteam, class_name: "Team",
						foreign_key: "awayteam_id"

	default_scope {where("date > ?", Time.zone.now)}
	scope :start_date -> (time) { where("date > ?",time)}
	scope :end_date -> (time) { where("date < ?",time)}
end
